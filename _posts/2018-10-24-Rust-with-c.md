---
layout: post
title:  "Rust over C"
permalink: rust-over-c
date: 2018-10-24
---

Rust is the new systems language language which is, in a way, can
truly challenge the dominance of `C` that it enjoys for past 40 years.
Before going further let it be made clear that this post is not to
undermine the simplicity or performance of `C` programming. In fact,
if `C` or `C++` works for some one, for a given project, then there
is no need to consider [Rust][rust], for that matter any other language,
over `C`.

If I where to pick `C` as the choice of language for a project, it might
be for one or more of the following reasons:

* Need to directly interact with H/W, like writing boot loader, device
  driver etc.
* Performance is critical.
* Portability across different hardware.
* Inter-operability with programs written in other languages.
* Vibrant ecosystem, due to its simplicity and brevity.
* Real time systems requiring predictable behavior.

Let us look at them one by one, though not necessarily the same order.

Hardware access
---------------

Most languages, like [Java][java] / [Python][python] / [Javascript][js] /
[Ruby][ruby] abstract the underlying hardware though Virtual Machines.
And some of them like [Golang][golang], and [Haskell][haskell] that
compile directly to machine code, still restrict programmers from
accessing memory or peripherals (unlike C's pointers).

Rust allows everything that `C` can provide, especially with regards to
pointers, with just one aspect added to it - safety. Actually it is not
just a feature, it is a dimension that cut across every other feature
in the Rust language. Whether it is data or code, safety is strict by
default, it is really hard to shoot our-self on the foot as long as
we are writing safe code. And for H/W access we can restrict them into
separate functions and mark them unsafe.

Performance
-----------

Performance in `C` programs come from:

* Simple data types that can optimally be configured for cache hits,
  alignments, memory footprint etc.
  * Rust, the amazing type system of rust, when compiled, manages to
    reduce them to `C` like simplicity.
* No GC.
  * Rust, similar to `C`, does not have a GC by default, but at the same
    time programmers don't have to alloc/free memory. There are no
    dangling pointers and no memory leaks that are common to `C` programs.
* No hidden cost due to compiler introduced scaffolds.
  * Rust follows zero-cost-abstraction, programmers can enjoy
    the higher level abstractions in rust without worrying about hidden
    cost that might be introduced by compiler.
* Lean stack model for function calls and local variables.
  * Rust does not make any compromises in its stack and heap model
* A well aged compiler and language design.
  * Rust design includes some of the latest advancements in type system
    along with memory safety built into the language. And inspite of
    being a very young language its performance is comparable to `C++`,
    if not with `C`.

Portability
-----------

One of the initial purpose for designing the `C` language was portability,
which has two angle to it. One, programmers can write code without
worrying about machine instructions, or its design architecture. Second,
availability of a `C` compiler for pretty much every processor platform.

Rust uses LLVM as its backend for generating them the machine code. And
LLVM can already compile to several processor platforms and has a vibrant
community. And when compare to `C`, Rust is far more agnostic to the
processor or its target platform. As a added bonus, while Unix is the
favorite OS for `C` programmers (at least historically speaking), such OS
specific nuances does not stick into Rust programming.

Inter-operability
-----------------

Good amount of programs are written, document and distributed as libraries.
Inter-operability means, such libraries can be exported to other languages
through its FFI (Foreign Function Interface). And `C` is the first, and most
likely the only, language that most of the languages support in its FFI.

Rust, by using `C` representation for its data format (using `repr` attribute)
and functions can be linked with other languages as easily as `C`.

Simple design
-------------

Often sited advantage of `C` is its simplicity for programming. For some one
whose is already comfortable with micro-processors and computer architecture
`C` is easy to learn.

Rust type system, functional paradigms of programming, it memory safety and
lifetimes are new ideas for most of the programmers. Yes there is a bit of
learning curve before getting productive with Rust, but most of the higher
level abstractions, except trait-objects, are built on top of `C` like simple
design. The entire Rust reference-manual is around 100-150 pages long.

Predictable runtime
-------------------

Often sited disadvantage of higher level languages like Haskell, Java,
Python etc. is that, their runtime execution is unpredictable and cannot
be used in real-time systems, where latency and response times are
critical.  Root cause of unpredictable latency primarily hinges on:

* Garbage collection.
* Runtime Scheduler for green-threads compiled into the application.
* Pass by reference.
* Pointer indirection due to virtual-tables and other abstractions.

In Rust, but has strong ownership model to avoid Garbage collection. Rust
don't have green-threads and hence there is no scheduler compiled into
rust programs. Even if green-threads are supported in future versions of
Rust, it is most likely an opt-in feature. Rust uses Mono-morphisation
technique to avoid pass by reference, except in case of trait objects.
Trait objects do have virtual tables, but using trait objects have to be
explicit in Rust.

[rust]: https://www.rust-lang.org
[java]: https://en.wikipedia.org/wiki/Java_(programming_language)
[python]: https://en.wikipedia.org/wiki/Python_(programming_language)
[js]: https://en.wikipedia.org/wiki/JavaScript
[haskell]: https://en.wikipedia.org/wiki/Haskell_(programming_language)
[ruby]: https://en.wikipedia.org/wiki/Ruby_(programming_language)
[golang]: https://en.wikipedia.org/wiki/Go_(programming_language)

