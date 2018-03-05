#' Print the Human-readable Representation of the Proto Object
#' 
#' @param x The proto object
#' @export
#' 
#' @examples
#' \dontrun{
#' 
#' library(onnx)
#' 
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
#' print_readable(graph_def)
#' 
#' }
print_readable <- function(x) {
  UseMethod("print_readable")
}

#' @export
print_readable.onnx_pb2.GraphProto <- function(x) {
  print_readable_impl(x, "graph")
}

#' @export
print_readable.onnx_pb2.AttributeProto <- function(x) {
  print_readable_impl(x, "attribute")
}

#' @export
print_readable.onnx_pb2.NodeProto <- function(x) {
  print_readable_impl(x, "node")
}

#' @export
print_readable.onnx_pb2.ValueInfoProto <- function(x) {
  print_readable_impl(x, "value_info")
}

print_readable_impl <- function(
  x,
  method = c(
    "graph",
    "attribute",
    "node",
    "value_info")) {

  cat(
    do.call(
      onnx$helper[[paste0('printable_', method)]],
      list(x, "")))
}
