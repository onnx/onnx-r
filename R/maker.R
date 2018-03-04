#' Makes an AttributeProto based on the value type.
#' 
#' @param key key
#' @param value value
#' @param doc_string doc_string
#' 
#' @export
make_attribute <- function(key, value, doc_string = NULL) {
  onnx$helper$make_attribute(
    key = key,
    value = value,
    doc_string = doc_string
  )
}

#' Makes an GraphProto.
#' 
#' @param nodes nodes
#' @param name name
#' @param inputs inputs
#' @param outputs outputs
#' @param initializer initializer
#' @param doc_string doc_string
#' 
#' @export
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


#' Makes an NodeProto.
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
    inputs = as.list(inputs),
    outputs = as.list(outputs),
    name = name,
    doc_string = doc_string
  )
}

#' Make a TensorProto with specified arguments.
#'
#' If raw is FALSE, this function will choose the corresponding proto field to
#' store the values based on data_type. If raw is TRUE, use "raw_data" proto
#' field to store the values, and values should be of type bytes in this case.
#'
#' @param name name
#' @param data_type data_type
#' @param dims dims
#' @param vals vals
#' @param raw raw
#'
#' @export
make_tensor <- function(name, data_type, dims, vals, raw = FALSE) {
  onnx$helper$make_tensor(
    name = name,
    data_type = data_type,
    dims = dims,
    vals = vals,
    raw = raw
  )
}

#' Makes an AttributeProto based on the value type.
#' 
#' @param key key
#' @param value value
#' @param doc_string doc_string
#' 
#' @export
make_attribute <- function(key, value, doc_string = NULL) {
  onnx$helper$make_attribute(
    key = key,
    value = value,
    doc_string = doc_string
  )
}

#' Makes a TypeProto based on the data type and shape.
#' 
#' @param name name
#' @param elem_type elem_type
#' @param shape shape
#' @param doc_string doc_string
#' 
#' @export
make_tensor_value_info <- function(name, elem_type, shape, doc_string = "") {
  onnx$helper$make_tensor_value_info(
    name = name,
    elem_type = elem_type,
    shape = as.list(shape),
    doc_string = doc_string
  )
}
