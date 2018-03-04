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