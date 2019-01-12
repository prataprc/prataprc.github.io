---
layout: post
title:  "Operations on JSON"
permalink: json-operations.html
date: 2019-01-09
---

This write up aims to define common arithmetic, bit-wise, logical
and compare operations that can be applied on JSON values. Note
that JSON values can be of mixed types, in other words, operands in
a binary operation not necessarily belong to same JSON type - so as
to implement computational operations for schema-less documents.

A reference implementation of this proposal is provided by the
[Rust][rust] library [jsondata][jsondata].

List of operations that we are going to study here:

* **Arithmetic** operations, ADD, SUB, MUL, DIV, REM, NEG.
* **Bitwise** operations, SHL, SHR, BITAND, BITOR, BITXOR.
* **Logical** operations, NOT, AND, OR.
* **Compare** operations EQ, NE, LT, LE, GT, GE.
* **Index** operations.
* **Range** operations.

Arithmetic operation
====================

<div id="tab-arithmetic">
  <ul>
    <li><a href="#add">ADD +</a></li>
    <li><a href="#sub">SUB -</a></li>
    <li><a href="#mul">MUL *</a></li>
    <li><a href="#div">DIV /</a></li>
    <li><a href="#rem">REM %</a></li>
    <li><a href="#neg">NEG -</a></li>
  </ul>
  <div id="add"> </div>
  <div id="sub"> </div>
  <div id="mul"> </div>
  <div id="div"> </div>
  <div id="rem"> </div>
  <div id="neg"> </div>
</div>

  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Null     | (any)     | (any)    | identity operation
  (any)    | Null      | (any)    | identity operation
  Integer  | Integer   | Integer  | integral addition
  Float    | Float     | Float    | floating point addition
  Integer  | Float     | Float    | integer shall be converted to float
  Float    | Integer   | Float    | integer shall be converted to float
  String   | String    | String   | string concatenation <br> ``"hello" + "world" = "helloworld"``
  Array    | Array     | Array    | ``[1,2] + [2,1] = [1,2,2,1]``
  Object   | Object    | Object   | ``{"a": 10, "b": 11} + {"b": 20} = {"a":10, "b":20}``

  lhs      | rhs       | result  | description
-----------|-----------|---------|-------------------
  Null     | (any)     | (any)   | identity operation
  (any)    | Null      | (any)   | identity operation
  Integer  | Integer   | Integer | integral subtraction
  Float    | Float     | Float   | floating point subtraction
  Integer  | Float     | Float   | integer shall be converted to float
  Float    | Integer   | Float   | integer shall be converted to float
  Array    | Array     | Array   | ``[1,1,2,2,2] - [2,2,1] = [1,2]``
  Object   | Object    | Object  | ``{"a":10, "b":20} - {"b":20} = {"a":10}``

  lhs      | rhs       | result  | description
-----------|-----------|---------|------------
  Null     | (any)     | Null    | anything multiplied by Null is Null
  (any)    | Null      | Null    | anything multiplied by Null is Null
  Integer  | Integer   | Integer | integral multiplication
  Float    | Float     | Float   | floating point multiplication
  Integer  | Float     | Float   | integer shall be converted to float
  Float    | Integer   | Float   | integer shall be converted to float
  String   | Integer   | String  | ``"ok" * 3 = "okokok"`` and ``"ok" * 0 = ""`` 
  Integer  | String    | String  | ``3 * "ok" = "okokok"``

  lhs      | rhs       | result  | description
-----------|-----------|---------|------------
  Null     | (any)     | Null    | anything divided by Null is Null
  (any)    | Null      | Null    | anything divided by Null is Null
  Integer  | Integer   | Integer | integral division
  Float    | Float     | Float   | floating point division
  Integer  | Float     | Float   | integer shall be converted to float
  Float    | Integer   | Float   | integer shall be converted to float

  lhs      | rhs       | result  | description
-----------|-----------|---------|------------
  Null     | (any)     | Null    | anything reminder of Null is Null
  (any)    | Null      | Null    | anything reminder of Null is Null
  Integer  | Integer   | Integer | integral reminder
  Float    | Float     | Float   | floating point reminder
  Integer  | Float     | Float   | integer shall be converted to float
  Float    | Integer   | Float   | integer shall be converted to float

  unary operand   | result  | description
------------------|---------|------------
  Null		      | Null    | negation of Null is Null
  Integer	      | Integer | integral negation
  Float		      | Float   | floating point negation

<br>

* **Null** is essentially a short-circuiting operand.
* Silent overflow shall occur with all integral arithmetic operations.
* Arithmetic operations of all other combinations, that are not listed
  above, shall lead to error.

Bitwise operations
==================

<div id="tab-bitwise">
  <ul>
    <li><a href="#shl">SHL << </a></li>
    <li><a href="#shr">SHR >> </a></li>
    <li><a href="#bitand">BITAND &</a></li>
    <li><a href="#bitor">BITOR |</a></li>
    <li><a href="#bitxor">BITXOR ^ </a></li>
  </ul>
  <div id="shl"> </div>
  <div id="shr"> </div>
  <div id="bitand"> </div>
  <div id="bitor"> </div>
  <div id="bitxor"> </div>
</div>

  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Integer  | Integer   | Integer  | Bit-wise left shift, silent overflow. For all rhs, where <br> ``(2^(rhs+1)) >= max(int)`` <br> result shall be ZERO


  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Integer  | Integer   | Integer  | Bit-wise right shift, sign bit moves right. For all rhs, where <br> ``(2^(rhs+1)) >= max(int)`` <br> result shall be ZERO, for positive integer <br> result shall be -1, for negative integer


  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Integer  | Integer   | Integer  | Bit-wise AND operation between two signed integers


  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Integer  | Integer   | Integer  | Bit-wise OR operation between two signed integers


  lhs      | rhs       | result   | description
-----------|-----------|----------|-------------------
  Integer  | Integer   | Integer  | Bit-wise XOR operation between two signed integers

<br>

* Json integers are signed, this implies that, both right shift and
  left shift are going to be [arithmetic right shift and left shift][ashr].
* Bitwise operations of all other combinations, that are not listed
  above, shall lead to error.

Logical operations
==================

For the purpose of logical operations, following JSON types/values shall
be coerced to ``true`` or ``false``.

* **Null** shall be treated as false.
* **Boolean true** shall be treated as true.
* **Boolean false** shall be treated as false.
* **Numerical zero** shall be treated as false.
* **All other numbers** shall be treated as true.
* **Empty string** shall be treated as false.
* **Non empty string** shall be treated as true.
* **Empty array** shall be treated as false.
* **Non empty array** shall be treated as true.
* **Empty object** shall be treated as false.
* **Non empty object** shall be treated as true.

With types and values reduced to either true or false, results of a
logical operator simply follows the Boolean truth table.

<div id="tab-logical">
  <ul>
    <li><a href="#and">AND & </a></li>
    <li><a href="#or">OR | </a></li>
    <li><a href="#not">NOT ! </a></li>
  </ul>
  <div id="and"> </div>
  <div id="or"> </div>
  <div id="not"> </div>
</div>

  lhs   | rhs    | result
--------|--------|----------
  true  | true   | true
  true  | false  | false
  false | true   | false
  false | false  | false

  lhs   | rhs    | result
--------|--------|----------
  true  | true   | true
  true  | false  | true
  false | true   | true
  false | false  | false

  unary operand  | result
-----------------|----------
  true           | false
  false          | true

<br>

Compare operation
=================

Gist of rules for compare operation:

* Null type shall sort before all other types.
* Boolean type shall sort after Null type.
  * Boolean false value sort before true value.
* Number type shall sort after Boolean type.
  * F64 values that are <= -2^127 will sort before all i128 integers.
  * F64 values that are >= 2^127-1 will sort after all i128 integers.
  * NaN, Not a Number, value shall sort after all i128 integers
  * -Infinity shall sort before all numbers.
  * +Infinity shall sort after all numbers.
  * NaN shall sort after +Infinity
* String type shall sort after Number type.
  * String values are compared byte by byte.
* Array type shall sort after String type.
* Object type shall sort after Array type.
  * All (key,value) pairs within the object shall be presorted based on the key.
  * When comparing two objects, comparison shall start from first key and proceed to the last key.
  * If two keys are equal at a given position within the objects, then its corresponding values shall be compared.
  * When one object is a subset of another object, as in, if one object contain all the (key,value) properties that the other object has then it shall sort before the other object.

A more detailed description can be found here: [sort order for json][sort-order]

Index operation
===============

Index operation is applicable only on ``array`` and ``object`` types.

* For ``array``, index operand shall be signed integer.
* Positive index shall pick items starting from 0 to end.<br>
  For example array - ``arr = [1, 2, true, null, 3.4, [1,2]]``
  * arr[0] shall return ``1``.
  * arr[1] shall return ``2``.
  * arr[5] shall return ``[1,2]``.
* Negative index shall pick items starting from -1 from end to beginning.<br>
  For example array - ``arr = [1, 2, true, null, 3.4, [1,2]]``
  * arr[-1] shall return ``[1,2]``.
  * arr[-2] shall return ``3.4``.
  * arr[-6] shall return ``1``.
* If array index is out of bounds, result shall be an error.

* For ``object``, index operand shall be string, treated as key value.
* If index key is not present in an object, result shall be an error.

Range operation
===============

Range operation is applicable only on ``array`` type, uses similar syntax
as index operation but selects a range of values within the array. For
example array ``arr = [1, 2, true, null, 3.4, [1,2]]``,

* ``arr[1..]`` returns ``[2, true, null, 3.4, [1,2]]``.
* ``arr[1..3]`` returns ``[2, true]``.
* ``arr[..3]`` returns ``[1, 2, true]``.
* ``arr[..]`` returns the entire collection of array.
* ``arr[..=3]`` returns ``[1, 2, true, null]``.
* ``arr[1..=3]`` returns ``[2, true, null]``.

Package jsondata
================

In [jsondata][jsondata] the ``Assign`` variant of **Arithmetic** and
**Bitwise** operations are implemented as well. And specifically it
does not implement the following operations that are defined by
std::ops:

* _Deref_ used for immutable dereferencing operations.
* _DerefMut_ used for mutable dereferencing operations.
* _Drop_, used to run some code when a value goes out of scope.
* _Fn_, version of the call operator that takes an immutable receiver.
* _FnMut_, version of the call operator that takes a mutable receiver.
* _FnOnce_, version of the call operator that takes a by-value receiver.
* _RangeBounds_, is implemented, over _isize_, as a range() method on Json type.

[rust]: https://www.rust-lang.org/
[jsondata]: https://github.com/bnclabs/jsondata
[ashr]: https://en.wikipedia.org/wiki/Arithmetic_shift
[sort-order]: ./json-sort-order.html
