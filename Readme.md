# easyCalc

It aims at making basic operations in OCaml polymorphic

## Warning!

This should NOT be used. This is a toy project and is not safe:
it uses OCaml internals to reach its goal. Can lead to segfaults or worse.


## Operations

### Add

- int + int = int
- float + int = int + float = float + float = float
- string + string = string

### Sub

- int - int = int
- float - int = int - float = float - float = float

### Mul

- int * int = int
- float * int = int * float = float * float = float

### Div

- int / int = int
- float / int = int / float = float / float = float


## Note

The types noted above corresponds to the runtime types of the values.

This means that the empty list `[]` can be added to `true` and the result will be `1`.
