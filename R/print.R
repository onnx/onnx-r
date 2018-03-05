#' Print the Human-readable Representation of the Proto Object
#' 
#' @param x The proto object
#' @export
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
