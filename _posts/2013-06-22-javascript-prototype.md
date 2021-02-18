---
layout: post
title: "JS: Prototype inheritance in Javascript"
permalink: javascript-prototype.html
category: tech
---

This post will discuss exclusively about Javascript's prototype inheritance.
Many JS frameworks leverage on prototype inheritance to add that extra bit
black-magic in their tool.

Constructor
-----------

Any function call that is preceded by the `new` keyword acts as a constructor.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=constructor.js"></script>

Prototypes
----------

Object oriented-ness in Javascript is achieved by using prototype inheritance
and late binding of `this`.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=prototype.js"></script>


This
----

`this` can be bound in five different ways,

* Global scope, here `this` refers to the global object and any side affects
  on this object will affect global namespace and name-resolution.
* Function scope, inside functions `this` will again refer to global object.
* Constructor scope, functions when called with `new` prefix - will 
  instantiate a new instance of `object` and this will be bound to that
  object-instance.
* Method scope, are functions bound to object-instances. `this` will always
  refer to the object-instance.
* Explicit setting, using apply and call methods from Function.prototype.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=this.js"></script>

In case of setTimeout and setInterval timeout-handlers, `this` when used
inside the handler function will refer to global object.
