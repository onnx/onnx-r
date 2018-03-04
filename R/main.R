#' Loads a binary protobuf that stores onnx model
#' 
#' @param obj a file-like object (has "read" function)
#' or a string containing a file name
#' 
#' @return ONNX ModelProto object
#' 
#' @export
load_from_file <- function(obj) {
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
