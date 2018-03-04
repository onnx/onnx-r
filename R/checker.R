#' @export
check <- function(object) {
  UseMethod("check")
}

#' @export
check.onnx_pb2.ModelProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_model(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
check.onnx_pb2.GraphProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_graph(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
check.onnx_pb2.TensorProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_tensor(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
check.onnx_pb2.AttributeProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_attribute(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
check.onnx_pb2.NodeProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_node(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}