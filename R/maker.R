#' Make Different Types of Protos
#' 
#' This includes AttributeProto, GraphProto, NodeProto, TensorProto,
#' TensorValueInfoProto, etc.
#' 
#' @export
#' @rdname maker

#' @param key The key
#' @param value The value
#' @param doc_string The doc_string
#' @param nodes The nodes
#' @param name The name
#' @param inputs The inputs
#' @param outputs The outputs
#' @param initializer The initializer
#' @param op_type The op type
#' @param data_type The data type
#' @param dims The dimensions
#' @param vals The values
#' @param raw If this is `FALSE``, this function will choose the corresponding proto field to
#' store the values based on `data_type`. If raw is `TRUE`, use "raw_data" proto
#' field to store the values, and values should be of type bytes in this case.
#' @param elem_type The element type, e.g. `onnx$TensorProto$FLOAT`
#' @param shape The shape
#' 
#' @export
#' @rdname maker
make_attribute <- function(key, value, doc_string = NULL) {
  onnx$helper$make_attribute(
    key = key,
    value = value,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_graph <- function(nodes, name, inputs, outputs, initializer = NULL, doc_string = NULL) {
  onnx$helper$make_graph(
    nodes = as.list(nodes),
    name = name,
    inputs = as.list(inputs),
    outputs = as.list(outputs),
    initializer = initializer,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_node <- function(op_type, inputs, outputs, name = NULL, doc_string = NULL) {
  onnx$helper$make_node(
    op_type = op_type,
    inputs = as.list(inputs),
    outputs = as.list(outputs),
    name = name,
    doc_string = doc_string
  )
}

#' @export
#' @rdname maker
make_tensor <- function(name, data_type, dims, vals, raw = FALSE) {
  onnx$helper$make_tensor(
    name = name,
    data_type = data_type,
    dims = dims,
    vals = vals,
    raw = raw
  )
}

#' @export
#' @rdname maker
make_tensor_value_info <- function(name, elem_type, shape, doc_string = "") {
  onnx$helper$make_tensor_value_info(
    name = name,
    elem_type = elem_type,
    shape = as.list(shape),
    doc_string = doc_string
  )
}
