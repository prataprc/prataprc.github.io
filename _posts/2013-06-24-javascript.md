---
layout: post
title: "JS: Javascript in a nutshell"
permalink: javascript.html
---

I like languages that can be explained within few pages of a book. Besides C,
Lua, Erlang - Javascript is one such language to have that simplicity. This
post is a quick reference guide to javascript, highlighted through examples
and all of them can be found [here][here1-link].

Literals
--------

All languages are defined as collection of tokens and tokens are normally
classified as literals, keywords, operators or identifiers. Literals are
data-objects that are hard-coded in the program, they are baked into the
language for sake of efficiency.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=literals.js"></script>

Other than primitive types - Number, String, Boolean, rest of them are
javascript objects. Javascript `Object` is the parent type for all
user-defined types. Supports constructor pattern, prototype inheritance etc...

Keywords
--------

Keywords are special tokens that give additional structure to the program.
Following is a basic set of keywords in Javascript

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=keywords.js"></script>

Note that `typeof` is unreliable in most implementation of Javascript. It
is better to use - `Object.prototype.toString(10)` to retrieve the type of an
object, although you will have to process the returned string to remove the
prefix.

To remove a property name from object, use `delete` instead of assigning
`null`.

Keywords that add conditional structure,

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=condblocks.js"></script>

Only the ternary operator can be treated as expression rest every thing are
statements.

Keywords that add looping structure,

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=loop.js"></script>

All keywords that add looping structure are to be treated as statements.

Now let us move on to operators. While `literals` bake data values directly
into the language, for the sake of efficiency, `operators` are functions on
data values that are baked into the language.

Arithmetic-operators
--------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=ops_arith.js"></script>

Keep in mind that Javascript does lot of implicit type-coercion.

Comparison-operators
--------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=ops_comp.js"></script>

There is no real way to compare equality of non-primitive objects and in many
cases it is better to stick with `===` instead of `==`. Former compares
for both value and type, while the later compares only the value.

Logical-operators
-----------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=ops_logic.js"></script>

Bit wise operators
------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=ops_bitwise.js"></script>

Comments on the right side explain the output by demonstrating the operation
in binary-format. Conceptually, the bit-wise logical operators work as follows:

* the operands are converted to 32-bit integers and expressed by a series of
  bits (zeros and ones).
* each bit in the first operand is paired with the corresponding bit in the
  second operand: first bit to first bit, second bit to second bit, and so on.
* the operator is applied to each pair of bits, and the result is constructed
  bit-wise.

If you are a C programmer, you might already be knowing the
difference between between arithmetic `>>` and logical `>>>` right shift.
Otherwise, just remember the following points,

* Right-shift matters only to negative numbers that can be represented in
  32-bit 2's complement.
* Arithmetic right-shift preserves the sign while logical does-not.
* Logical right-shift will stuff as many binary 0s on the left as that are
  shifted out on the right.

Looks like bit-wise operations on large integers are left undefined in
Javascript.

Assignment operators
--------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=ops_assign.js"></script>

Normally assignments are statement in many languages. In Javascript an
assignment is treated like an expression, and based on the scope of the
expression, the context where the side effects are created varies. It is
explained in a separate section below.

There is also membership operator `.` that can be used to access property
names on objects.

Types
-----

Javascript is weakly typed. Please note that values and objects in Javascript
are strongly typed and values are always associated with same type. It is the
reference to values that are weakly typed - in the sense that same variable name
can refer to different types of value while the program is executing. It also
means that programmers can interpret a variable as particular type which can be
wrong and it is difficult to catch this problem at compile time.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=types.js"></script>

In the end of above gist, we demonstrate two other ways of creating a
number-value 10 and `n === m` give false because the former is number-type
while the later is object-type.

Function and scope
------------------

Following gist shows some name-resolution gymnastics with javascript functions.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=function.js"></script>

In javascript functions are the only means of code-abstraction and thereby
only form of scoping available for programmers. By default every function act
as a closure, making its local namespace available for enclosed function
definitions. And only those functions that are enclosed within the scope of an
outer-function can access the outer function's local namespace.

Make a note that parent function's namespaces are only referred by enclosed
function, parent function's namespace is not copied to enclosed function's
namespace.

Function arguments can be accessed within a function like,

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=arguments.js"></script>

And some gymnastics with scope.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=scope.js"></script>

It is always a good practice to declare variables with `var`, so that it
gets contained in the enclosing scope. Javascript can hoists declarations,
that is, both var statements and function declarations will be moved to the
top of the enclosing scope.

Name resolution order,

- In case there is a var foo statement in the current scope, use that.
- If one of the function parameters is named foo, use that.
- If the function itself is called foo, use that.
- Go to the next outer scope, and start again.

Another thing about scoping is that there is only one global namespace. That
is Javascript does not have the notion of modules, hence everything is
executed in the context of the same single global namespace.

Evaluation
----------

Since Javascript is byte-code interpreted language, program text can be parsed
compiled to virtual-machine byte code and executed on the fly.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=eval.js"></script>

A curious aspect here is that even statements like `if` blocks are executed
as expression and value is returned. Note that it is not legal to do `a =
if(true) {100} else {200}` in your `.js` file or under `<script>` tag of html.

Normally eval function will execute the script in the local-scope of the
caller. However, it only executes in the local scope when called directly.

[here1-link]: https://github.com/prataprc/gist/tree/master/js
