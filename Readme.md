# easyCalc

It aims at making basic operations in OCaml polymorphic

# Warning!

This should NOT be used. This is a toy project and is not safe:
it uses OCaml internals to reach its goal. Can lead to segfaults or worst.


# Operations

## Add

- int + int = int
- float + int = int + float = float + float = float

## Sub

- int - int = int
- float - int = int - float = float - float = float

## Mul

- int * int = int
- float * int = int * float = float * float = float

## Div

- int / int = float / int = int / float = float / float = float
