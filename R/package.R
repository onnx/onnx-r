#' ONNX in R
#' 
#' @docType package
#' @name onnx
NULL

backend <- NULL
onnx <- NULL
np <- NULL

.onLoad <- function(libname, pkgname) {
  
  backend <<- reticulate::import("onnx_tf.backend")
  onnx <<- reticulate::import("onnx")
  np <<- reticulate::import("numpy", convert = FALSE, delay_load = TRUE)
}
