#' R Interface to ONNX
#' 
#' @docType package
#' @name onnx
NULL

onnx <- NULL
np <- NULL

.onLoad <- function(libname, pkgname) {
  
  onnx <<- reticulate::import("onnx")
  np <<- reticulate::import("numpy", convert = FALSE, delay_load = TRUE)
}
