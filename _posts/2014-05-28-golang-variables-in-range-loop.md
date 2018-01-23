---
layout: post
title: "Golang - variables in range loop"
permalink: golang-variables-in-range-loop.html
---

Golang provides an interesting construct to range over arrays and maps. For
instance to range over arrays,

```go
type X struct {
    n int
    square int
}

func main() {
    var xs [4]X
    for i, x := range xs {
        x.a, x.b = i, i*i
    }
}
```

`xs` is the slice, `i` is the index for each iteration and `x` holds the value
for each iteration.

Some times while doing the above pattern of programming, especially coming
from other languages, it is easy to get confused. For instance, let us say we
want to build a `map` out of an array by ranging over them,

```go
func main() {
    var xs [4]X
    ym := make(map[*X]int) // the map we need to build
    for i, x := range xs {
        ym[&x] = i*i*i
        fmt.Printf("%p %p\n", &x, &xs[i])
    }
    fmt.Println("Map output")
    fmt.Println(ym)
}
```

above program, when executed, emits following output

```text
0x2101fb150 0x210230040
0x2101fb150 0x210230050
0x2101fb150 0x210230060
0x2101fb150 0x210230070
map[0x2101fb150:100]
```

why does the map contain just one key ? why is the address of `x` in each
iteration is the same. The common type of misconception that leads to this
confusion is the way we understand how `x` is declared and reused. The
misconception can be explained by expanding the range loop into traditional
for-loop,

```go
ym := make(map[*X]int) // the map we need to build
for i := 0; i < len(xs); i++ {
    x := xs[i]
    ...
}
```

which is wrong, the correct way of expanding the range loop, as implemented by
go, would be,

```go
ym := make(map[*X]int) // the map we need to build
var x X
for i := 0; i < len(xs); i++ {
    x = xs[i]
    ...
}
```
