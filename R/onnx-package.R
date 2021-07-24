#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

onnx <<- NULL
np <<- NULL

.onLoad <- function(libname, pkgname) {
  
  # Delay load handler
  delay_load <- list(
    
    priority = 5,
    
    environment = "onnx-r",
    
    on_load = function() {},
    
    on_error = identity
  )
  
  onnx <<- reticulate::import("onnx", delay_load = delay_load)
  np <<- reticulate::import("numpy", convert = FALSE, delay_load = TRUE)
}
