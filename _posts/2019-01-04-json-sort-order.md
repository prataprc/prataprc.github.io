---
layout: post
title:  "Sort order for JSON"
permalink: json-sort-order.html
date: 2019-01-04
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
* NaN, Not a Number values shall sort after all i128 integers.

Also there is the [total ordering][totalorder] issue for floating
point numbers, and JSON specification do not define _-Infinity_,
_+Infinity_ and _NaN_ values that are part of the floating point
specification. These tokens are defined in the [JSON5][json5]
specification. And its sort order shall be defined, for the
sake of total ordering, as

* **-Infinity** shall sort before all numbers.
* **+Infinity** shall sort after all numbers.
* **NaN** shall sort after +Infinity.

Sort order for string value
===========================

Sorting string value is complex because of Unicode and UTF8-encoding.
In some languages the order of character glyph don't have a
similar ordering when converted to their Unicode code points.
Also, UTF8-encoding introduces other complexities. For simplicity
sake we can do binary comparison of string values, after the
escape-encoding is removed.

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

Note that length of the array shall not be considered by the comparator
logic.

Sort order for object values
============================

Similar to array, length of an object value shall not be taken into
account for sort order. Instead,

* All (key,value) pairs within the object shall be presorted based on
  the key.
* When comparing two objects, comparison shall start from first key and
  proceed to the last key.
* If two keys are equal at a given position within the objects, then
  its corresponding values shall be compared.
* When one object is a subset of another object, as in, if one object
  contain all the (key,value) properties that the other object has then
  it shall sort before the other object.

Range operation
===============

The purpose of maintaining sorted set of JSON values is, for users
to do range operation on the value set. This means we will have to define
tokens for,

* From the beginning.
* Till the end.

Again JSON specification do not define anything related to this. Hence
as a proposal to extend JSON, we can include 2 reserved tokens -

* **Minbound**, that denotes from the beginning.
* **Maxbound**, that denotes till the end.

This can be added in future specification.

[json]: https://tools.ietf.org/html/rfc8259
[json5]: http://json5.org
[totalorder]: https://en.wikipedia.org/wiki/Total_order
[rust]: https://www.rust-lang.org/
[jsondata]: https://github.com/bnclabs/jsondata
