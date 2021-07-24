#' Make Different Types of Protos
#' 
#' This includes AttributeProto, GraphProto, NodeProto, TensorProto,
#' TensorValueInfoProto, etc.
#' 
#' @param key The key
#' @param value The value
#' @param doc_string The doc_string
#' @param nodes The nodes
#' @param name The name
#' @param inputs The inputs
#' @param outputs The outputs
#' @param initializer The initializer
#' @param op_type The op type
#' @param data_type The data type
#' @param dims The dimensions
#' @param vals The values
#' @param raw If this is `FALSE``, this function will choose the corresponding proto field to
#' store the values based on `data_type`. If raw is `TRUE`, use "raw_data" proto
#' field to store the values, and values should be of type bytes in this case.
#' @param elem_type The element type, e.g. `onnx$TensorProto$FLOAT`
#' @param shape The shape
#' 
#' @examples 
#' \dontrun{
#' 
#' library(onnx)
#' 
#' # Define a node protobuf and check whether it's valid
#' node_def <- make_node("Relu", list("X"), list("Y"))
#' check(node_def)
#' 
#' # Define an attribute protobuf and check whether it's valid
#' attr_def <- make_attribute("this_is_an_int", 123L)
#' check(attr_def)
#' 
#' # Define a graph protobuf and check whether it's valid
#' graph_def <- make_graph(
#'     nodes = list(
#'       make_node("FC", list("X", "W1", "B1"), list("H1")),
#'       make_node("Relu", list("H1"), list("R1")),
#'       make_node("FC", list("R1", "W2", "B2"), list("Y"))
#'     ),
#'     name = "MLP",
#'     inputs = list(
#'       make_tensor_value_info('X' , onnx$TensorProto$FLOAT, list(1L)),
#'       make_tensor_value_info('W1', onnx$TensorProto$FLOAT, list(1L)),
#'       make_tensor_value_info('B1', onnx$TensorProto$FLOAT, list(1L)),
#'       make_tensor_value_info('W2', onnx$TensorProto$FLOAT, list(1L)),
#'       make_tensor_value_info('B2', onnx$TensorProto$FLOAT, list(1L))
#'     ),
#'     outputs = list(
#'       make_tensor_value_info('Y', onnx$TensorProto$FLOAT, list(1L))
#'     )
#' )
#' check(graph_def)
#' 
#' }
#' 
#' @export
#' @rdname maker
make_attribute <- function(key, value, doc_string = NULL) {
  onnx$helper$make_attribute(
    key = key,
    value = value,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_graph <- function(nodes, name, inputs, outputs, initializer = NULL, doc_string = NULL) {
  onnx$helper$make_graph(
    nodes = as.list(nodes),
    name = name,
    inputs = as.list(inputs),
    outputs = as.list(outputs),
    initializer = initializer,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_node <- function(op_type, inputs, outputs, name = NULL, doc_string = NULL) {
  onnx$helper$make_node(
    op_type = op_type,
    inputs = as.list(inputs),
    outputs = as.list(outputs),
    name = name,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_tensor <- function(name, data_type, dims, vals, raw = FALSE) {
  onnx$helper$make_tensor(
    name = name,
    data_type = data_type,
    dims = dims,
    vals = vals,
    raw = raw
  )
}

#' @export
#' @rdname maker
make_tensor_value_info <- function(name, elem_type, shape, doc_string = "") {
  onnx$helper$make_tensor_value_info(
    name = name,
    elem_type = elem_type,
    shape = as.list(shape),
    doc_string = doc_string
  )
}
