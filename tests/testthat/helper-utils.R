# Util Functions

have_onnx <- function() {
  reticulate::py_module_available("onnx")
}

skip_if_no_onnx <- function() {
  if (!have_onnx())
    skip("onnx not available for testing")
}

test_succeeds <- function(desc, expr) {
  test_that(desc, {
    skip_on_cran()
    skip_if_no_onnx()
    expect_error(force(expr), NA)
  })
}
