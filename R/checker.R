#' Check Whether The Proto is Valid
#' 
#' This method checks whether a protobuf in a particular type is valid.
#' @param proto The proto
#' @param ir_version The version of the proto
#' 
#' @export
#' @rdname checker
check <- function(proto, ir_version) {
  UseMethod("check")
}

#' @export
#' @rdname checker
check.onnx_pb2.ModelProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_model(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
#' @rdname checker
check.onnx_pb2.GraphProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_graph(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
#' @rdname checker
check.onnx_pb2.TensorProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_tensor(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
#' @rdname checker
check.onnx_pb2.AttributeProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_attribute(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}

#' @export
#' @rdname checker
check.onnx_pb2.NodeProto <- function(proto, ir_version = 3L) {
  onnx$checker$check_node(
    proto = proto,
    ir_version = as.integer(ir_version)
  )
}