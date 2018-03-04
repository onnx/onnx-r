context("Test onnx main methods")

source("helper-utils.R")

library(reticulate)

test_succeeds("Everything works", {
  # In this example, we will define and run a Relu node and print the result
  node_def <- onnx$helper$make_node("Relu", c("X"), c("Y"))
  output <- backend$run_node(node_def, list(list(-0.1, 0.1)))
  output[['Y']]

  ## https://github.com/onnx/tutorials/blob/master/tutorials/OnnxTensorflowImport.ipynb
  model <- onnx_load("~/Downloads/super_resolution.onnx")
  check(model)
  tf_rep <- backend$prepare(model)
  # tf_rep$predict_net
  # tf_rep$input_dict
  # tf_rep$uninitialized
  
  # Next, we will prepare an input image for inference. The steps below downloads
  # an example image, resizes it to the model's expected input shape, and finally
  # converts it into a numpy array.
  
  result <- py_run_string('
import numpy as np
from PIL import Image
img = Image.open("/Users/terrytangyuan/Downloads/super-res-input.jpg").resize((224, 224))
img_ycbcr = img.convert("YCbCr")
img_y, img_cb, img_cr = img_ycbcr.split()
doggy_y = np.asarray(img_y, dtype=np.float32)[np.newaxis, np.newaxis, :, :]')
  
  # Run the network!
  big_doggy <- tf_rep$run(result$doggy_y)
  expect_equal(dim(big_doggy[['_0']]), c(1, 1, 672, 672))
})
