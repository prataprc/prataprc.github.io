---
layout: post
title: "Sorting data"
permalink: sorting-data.html
---

Sorting is a human perception !

We, as a human, have a notion of what comes before and what comes after.

So, when we see data, whether as a count, or as a representation of
information, it is only natural for us to think what comes before and what
come after.

Computer languages provide us with basic set of data types, often called
as primitive type or built in types.

* Number, that include Integers and Floating point representations.
* Null, is to data-types, as ZERO is to Numbers.
* Boolean, for predicates.
* Character, typically a symbol or letter for composing human readable text.
* String, a sequence of character.
* Array, a composition of Number, and/or Null, and/or Boolean, and/or
  Character, and/or String, and/or array, and/or Map.
* Map, a {key, value} composition where key is typically an immutable
  hash-able data mapping to value of Number, and/or Null, and/or Boolean,
  and/or Character, and/or String, and/or array, and/or Map.

As to what comes before and what come after - Numbers have a strong
mathematical notion of sequence. But other data types, except Character,
simply don't have a notion of what comes before and what come after.
The lack of a sort order can be best understood by exploring to what
extent Characters can be sorted and how it came to be.

When I grew up we had the concept of attendance in class and the teacher
used to call out our names in alphabetical order. And that order is stuck
in my mind and that is the order I expect in string sorting, if it is
English.  But my mother tongue has more than 200 characters, and I don’t
know and I don't remember the order for those characters. In fact, I am
not even sure whether it matters.

Additionally there are certain European languages that uses Latin characters
for script and do have a sort order, but the sort order differs from one
context to another, for instance whether it is an index of "phone-book" or
"dictionary".

**Reference:**

* [ICU project collation design](http://site.icu-project.org/design/collation/v2)
* [Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Collator)
* [Userguid for ICU project collation architecture](http://userguide.icu-project.org/collation/architecture)
* [Collation from database perspective](https://www.ibm.com/support/knowledgecenter/en/SSGU8G_11.50.0/com.ibm.glsug.doc/ids_gug_026.htm)
