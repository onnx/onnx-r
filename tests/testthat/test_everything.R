context("Test onnx main methods")

source("helper-utils.R")

library(reticulate)

test_succeeds("onnx works", {
  node_def <- make_node("Relu", list("X"), list("Y"))
  expect_true(inherits(node_def, "onnx_pb2.NodeProto"))
  check(node_def)
  
  attr_def <- make_attribute("this_is_an_int", 123)
  expect_true(inherits(attr_def, "onnx_pb2.AttributeProto"))
  check(attr_def)
  
  graph_proto <- make_graph(
    nodes = list(
      make_node("FC", list("X", "W1", "B1"), list("H1")),
      make_node("Relu", list("H1"), list("R1")),
      make_node("FC", list("R1", "W2", "B2"), list("Y"))
    ),
    name = "MLP",
    inputs = list(
      make_tensor_value_info('X' , onnx$TensorProto$FLOAT, list(1L)),
      make_tensor_value_info('W1', onnx$TensorProto$FLOAT, list(1L)),
      make_tensor_value_info('B1', onnx$TensorProto$FLOAT, list(1L)),
      make_tensor_value_info('W2', onnx$TensorProto$FLOAT, list(1L)),
      make_tensor_value_info('B2', onnx$TensorProto$FLOAT, list(1L))
    ),
    outputs = list(
      make_tensor_value_info('Y', onnx$TensorProto$FLOAT, list(1L))
    )
  )
  check(graph_proto)
  expect_true(inherits(graph_proto, "onnx_pb2.GraphProto"))
})

test_succeeds("onnx_tf works", {
  if (length(list.files(pattern = ".onnx", recursive = TRUE)) == 0)
    skip(".onnx file not available for testing")
  skip_if_no_onnx_tf()
  tf_backend <- import("onnx_tf.backend")

  node_def <- make_node("Relu", c("X"), c("Y"))
  expect_true(inherits(node_def, "onnx_pb2.NodeProto"))
  output <- tf_backend$run_node(node_def, list(list(-0.1, 0.1)))
  expect_equal(output[['Y']], structure(c(0, 0.100000001490116), .Dim = 2L))
  
  ## Reference: https://github.com/onnx/tutorials/blob/master/tutorials/OnnxTensorflowImport.ipynb

  model <- load_from_file("inst/super_resolution.onnx")
  expect_true(inherits(model, "onnx_pb2.ModelProto"))
  check(model)
  tf_rep <- tf_backend$prepare(model)
  tf_rep$predict_net
  tf_rep$input_dict
  tf_rep$uninitialized
  expect_equal(length(names(tf_rep)), 4)

  if (py_module_available("numpy") && py_module_available("PIL")) {
    utils <- py_run_string('
def preprocess_image(img_path):
  import numpy as np
  from PIL import Image
  img = Image.open(img_path).resize((224, 224))
  img_ycbcr = img.convert("YCbCr")
  img_y, img_cb, img_cr = img_ycbcr.split()
  return np.asarray(img_y, dtype=np.float32)[np.newaxis, np.newaxis, :, :]')
    
    # Run the network!
    big_doggy <- tf_rep$run(utils$preprocess_image("inst/super-res-input.jpg"))
    expect_equal(dim(big_doggy[['_0']]), c(1, 1, 672, 672))
  }
})
