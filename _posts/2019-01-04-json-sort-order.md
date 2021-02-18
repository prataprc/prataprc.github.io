---
layout: post
title:  "Sort order for JSON"
permalink: json-sort-order.html
date: 2019-01-04
category: tech
---

Sort order for [JSON][json] data types.

This post discuss in detail the sort order for JSON data types. Specifically,

* Define sort order for different JSON types.
* Define sort order for values of each given types.

A reference implementation of this proposal is provided by the [Rust][rust]
library [jsondata][jsondata].

Sort order for types
====================

There are 4 primitive types and 2 composite types defined by JSON.

* **Null** type shall sort before all other types.
* **Boolean** type shall sort after Null type.
* **Number** type shall sort after Boolean type.
* **String** type shall sort after Number type.
* **Array** type shall sort after String type.
* **Object** type shall sort after Array type.

Among Boolean type, _false value sort before true value_.

Sort order for numerical values
===============================

JSON specification do not define a lower or upper limit for
numbers. Although it encourages programmers to stick within
[-(2^53)+1, (2^53)-1] range for the sake of inter-operability.

For the purpose of numerical-sorting, integers and floating point
numbers can be treated uniformly such that when comparing an integer
value and floating point value, later value is converted to
integer and compared. This means for 64-bit floating point,

* Values that are <= -2^127 will sort before all i128 integers.
* Values that are >= 2^127-1 will sort after all i128 integers.

Also there is the [total ordering][totalorder] issue for floating
point numbers, and JSON specification do not define _-Infinity_,
_+Infinity_ and _NaN_ values that are part of the floating point
specification. These tokens are defined in the [JSON5][json5]
specification. And its sort order shall be defined, for the
sake of total ordering, as

* **-Infinity** shall sort before all numbers.
* **-qNaN** negative quite-NaN shall sort after -Infinity.
* **-sNaN** positive signalling-NaN shall sort after -qNaN.
* **normal** and **sub-normal** shall sort after -sNaN.
* **+sNaN** signalling-NaN shall sort after normal numbers.
* **+qNaN** quite-NaN shall sort after +sNaN.
* **+Infinity** shall sort after all numbers.
* **-0.0** and **+0.0** shall be treated as equal.
* Different representation of floating point numbers are usually
  normalised in IEEE-754 format.
* Ordering between _sNaN_ and _qNaN_ in the same class being
  based on the integer payload, multiplied by the sign bit.

Sort order for string value
===========================

Sorting string value is complex because of Unicode and UTF8-encoding.
In some languages the order of character glyph don't have a
similar ordering when converted to their Unicode code points.
Also, UTF8-encoding introduces other complexities. For simplicity
sake we can do binary comparison of string values, after the
escape-encoding is removed. There are some notable collation standards -
[Unicode collation](http://unicode.org/reports/tr10) and
[ICU collation](http://userguide.icu-project.org/collation), that are
already available for string collation.

Sort order for array values
===========================

When sorting array values, array items shall be compared recursively,
applying the comparison logic on each array item and its counterpart.
For example:

* ``[]`` sort before ``[null]``.
* ``[null]`` sort before ``[true]``.
* ``[true]`` sort before ``[[null]]``.
* ``[10,20]`` sort before ``[30]``.
* ``[10, "hello"]`` sort before ``[10, "hello", "world"]``.

When comparison run out of items, array with lesser number of
items shall sort before the array with more number of items.

Sort order for object values
============================

* All (key,value) pairs within the object shall be presorted based on
  the key.
* When comparing two objects, comparison shall start from first key and
  proceed to the last key.
* If two keys are equal at a given position within the objects, then
  its corresponding values shall be compared.
* When one object is a subset of another object, as in, if one object
  contain all the (key,value) properties that the other object has then
  it shall sort before the other object.
* When comparison run out of items, object with lesser number of
  properties shall sort before the object with more number of properties.

Range operation
===============

The purpose of maintaining sorted set of JSON value is, for users
to do range operation on the value set. And when such operations
need to be performed over the wire, especially when using HTTP/JSON,
we may have to deal with unbounded values,

* From the beginning, called minimum bound.
* Till the end, called maximum bound.

Using HTTP/JSON means we may have to serialize these values over the
wire and once again JSON specification do not define anything related
to this. Hence as a proposal to extend JSON, we can include 2 reserved
tokens -

* **Minbound**, that denotes from the beginning.
* **Maxbound**, that denotes till the end.

This can be added in future specification.

Note that, when implementing _Range_ API as part of native libraries
we don't have to make unbounded values as part of JSON. _Minbound_
and _Maxbound_ is needed for serializing such queries over-the-wire
using JSON format.

[json]: https://tools.ietf.org/html/rfc8259
[json5]: http://json5.org
[totalorder]: https://en.wikipedia.org/wiki/Total_order
[rust]: https://www.rust-lang.org/
[jsondata]: https://github.com/bnclabs/jsondata
