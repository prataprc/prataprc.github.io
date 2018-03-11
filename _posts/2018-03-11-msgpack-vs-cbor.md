---
layout: post
title:  Benchmarking Msgpack with CBOR
permalink: msgpack-vs-cbor.html
---

JSON is by far the most popular serialization format used by programmers due
to its immense popularity in web. It is self describing, because it is encoded
in human readable text, and support a set data types that are available in
most of the languages. Nevertheless, there are few shortcomings as well.

* Inefficient over the wire due to bloated foot-print.
* Can be CPU hungry, because it is not friendly with machine format.
* No support for formal grammar definition, hence interface contracts are hard
  to communicate and enforce.

I am going to pick two alternative for JSON, [Msgpack](https://msgpack.org/)
and [CBOR](http://cbor.io/) and compare them with each other. I am also of
the opinion that both these format can do better in terms of CPU and Memory
footprint compared to JSON serialization. Hence, will be focusing on how
they are going to compare with each other.

**Support of data types**

Both formats have support for the common set of types nil, number, boolean,
string, binary, array and map. And both formats have support for extending
its encoding format for application defined types. Msgpack calls it as
`extension types` and CBOR calls it as `tags`. Between them I feel CBOR's
provisions are more future proof than Msgpack.

**CPU benchmark**

For CPU benchmark we will confine the measurements to the common set of data
types defined by JSON standard.

Following bar chart show the time taken to encode basic data types - nil,
int64, uint64, bool, bytes, string, array and map. This benchmark was done in
[go-language](golang), using [msgpack](msgpack) package and [gson](gson)
package.

![Encode benchmark between msgpack and cbor](media/gsoncharts/enc-msgpack-gson.svg)

* Across the board gson can give better performance by 1.5 to 3 times compared
  to msgpack implementation in golang.
* For an array of heterogeneous types, gson can do close to 15x better.

Following bar chart show the time taken to decode basic data types - nil,
int64, uint64, bool, bytes, string, array and map. This benchmark was done
in [go-language][golang], using [msgpack][msgpack] package and [gson][gson]
package.

![Decode benchmark between msgpack and cbor](media/gsoncharts/dec-msgpack-gson.svg)

* Decode performance slightly better in gson for types - nil, int64, uint64, float64,
  bool, and array.
* While for types - bytes, string, and map msgpack compares better. Most likely
  this is because gson allocates a new value while decoding these types.

**Memory footprint**

Following bar chart shows on-the-wire footprint when encoding basic data
types:

![Memory footprint msgpack and cbor](media/gsoncharts/footprint-msgpack-gson.svg)

As far as memory footprint or on-the-wire footprint goes, both the format give
comparable efficiency.

[golang]: http://golang.org
[msgpack]: https://github.com/vmihailenco/msgpack
[gson]: https://github.com/bnclabs/gson
