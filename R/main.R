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

#' Loads a binary string that stores onnx model
#' 
#' @param a string object containing protobuf
#' @return ONNX ModelProto object
#'
#' @export
load_from_string <- function(s) {
  if (!is.character(s)) 
    stop("You must provide a string containing protobuf")
  onnx$load_from_string(
    s = s
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
