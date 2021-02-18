---
layout: post
title: "JS: Caveats in Javascript"
permalink: javascript-caveats.html
category: tech
---

Every language has exceptional situations to common rules that are
explained as part of its specification. They end up as caveats in
programmer's mind.

Interchanging properties as objects and associative array
---------------------------------------------------------

Javascript objects are property-maps and property names can be accessed
using the membership operator. Likewise, objects can be accessed like
associative arrays passing in property name as index.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat1.js"></script>

Note that if accessed using membership operator, property name is constrained
by identifier token rules.

HasOwnProperty
--------------

A reference to JS object-property will follow the chain of prototype
inheritance, so the only way to figure out whether a property is directly
attached to the object is by using `hasOwnProperty` method call on the
object. But what if the method is overridden accidentally ?

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat2.js"></script>

Stacking Calls with setInterval
-------------------------------

`setInterval` will execute the timeout function every X milliseconds, where X
is the timeout value for the subscribed-handler. What happens if handler
function takes more time to complete than the timeout-value ?

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat3.js"></script>

You can execute the above program to understand the behavior of timeout
handling in Javascript. But the fact is, it is bad programming to use
setInterval a.k.a periodic-timeout if we doubt that the handler function is
going to take more time than the next timeout. One possible solution is given
in the above snippet itself.

Shadowing undefined
-------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat4.js"></script>

Unfortunately, `undefined` can also be used as identifier.

Semicolons and leading parenthesis
----------------------------------

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat5.js"></script>

The call to foo and bar are treated as single statement without a semicolon
in-between, `foo()(bar(10))`.

Deleting property names
-----------------------

It is not possible to delete a name whose `DontDelete` attribute is set.
This `DontDelete` attribute is a feature of javascript. Variables and
function declarations in global and function code always create properties
with DontDelete, and therefore cannot be deleted.

But `delete` works normal on property types, where names are added
programmatically. This applies even to global `this`, as demonstrated by the
last block of the following gist.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat6.js"></script>

Late-binding of this
--------------------

`this` name is bound late while making function calls.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat7.js"></script>

In the above example, `this` inside test function is not bound to `this`
of `new Foo()` instance when its constructor is called. Instead it is bound
to global object.

Closures and namespace reference
--------------------------------

In closures, parent function's namespaces are only referred by enclosed
function, they are not copied to enclosed function's namespace.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=caveat8.js"></script>

Outputs 10, 10 times.
