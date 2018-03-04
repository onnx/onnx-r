# Util Functions

skip_if_no_onnx <- function() {
  if (!reticulate::py_module_available("onnx"))
    skip("onnx not available for testing")
}

skip_if_no_onnx_tf <- function() {
  if (!reticulate::py_module_available("onnx_tf"))
    skip("onnx_tf not available for testing")
}

test_succeeds <- function(desc, expr) {
  test_that(desc, {
    skip_on_cran()
    skip_if_no_onnx()
    expect_error(force(expr), NA)
  })
}
