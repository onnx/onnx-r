#' Loads a binary protobuf that stores onnx model
#' 
#' @param obj a file-like object (has "read" function)
#' or a string containing a file name
#' 
#' @return ONNX ModelProto object
#' 
#' @export
onnx_load <- function(obj) {
  if (is.character(obj)) {
    obj <- normalizePath(obj)
  }
  onnx$load(
    obj = obj
  )
}

#' Define an ONNX node
#' 
#' @param op_type op_type
#' @param inputs inputs
#' @param outputs outputs
#' @param name name
#' @param doc_string doc_string
#' 
#' @export
make_node <- function(op_type, inputs, outputs, name = NULL, doc_string = NULL) {
  onnx$helper$make_node(
    op_type = op_type,
    inputs = inputs,
    outputs = outputs,
    name = name,
    doc_string = doc_string
  )
}
