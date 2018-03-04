# ONNX-R

R interface to [ONNX](https://github.com/onnx). This package is under heavy development.

## Installation

* Follow instructions [here](https://github.com/onnx/onnx#installation) to install the onnx Python package.
* Install the development version of the R package via

```
devtools::install_github("terrytangyuan/onnx-r")
```

## Examples

Main functionalities currently available are:

* `make_xxx()` to make different types of protobufs for attributes, nodes, graphs, and `tensor_value_info`s.
* a single `check()` method that can check whether a protobuf in a particular type is valid.

```r
# Define a node protobuf and check whether it's valid
node_def <- make_node("Relu", list("X"), list("Y"))
check(node_def)

# Define an attribute protobuf and check whether it's valid
attr_def <- make_attribute("this_is_an_int", 123L)
check(attr_def)

# Define a graph protobuf
graph_proto <- make_graph(
  nodes = list(
    make_node("FC", list("X", "W1", "B1"), list("H1")),
    make_node("Relu", list("H1"), list("R1")),
    make_node("FC", list("R1", "W2", "B2"), list("Y"))
  ),
  name = "MLP",
  inputs = list(
    make_tensor_value_info('X' , onnx$TensorProto$FLOAT, list(1L)),
    make_tensor_value_info('W1', onnx$TensorProto$FLOAT, list(1L)),
    make_tensor_value_info('B1', onnx$TensorProto$FLOAT, list(1L)),
    make_tensor_value_info('W2', onnx$TensorProto$FLOAT, list(1L)),
    make_tensor_value_info('B2', onnx$TensorProto$FLOAT, list(1L))
  ),
  outputs = list(
    make_tensor_value_info('Y', onnx$TensorProto$FLOAT, list(1L))
  )
)
check(graph_proto)
```