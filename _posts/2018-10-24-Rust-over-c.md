---
layout: post
title:  "Rust over C"
permalink: rust-over-c
date: 2018-10-24
---

Rust is the new systems language which can, in a way, truly challenge
the 40 year dominance of `C`. Before going further let it be made
clear that this post is not to undermine the simplicity or performance
of `C` programming. In fact, if `C` or `C++` works for someone,
for a given project, then there is no need to consider [Rust][rust],
for that matter any other language, over `C`.

If I were to pick `C` as the choice of language for a project, it might
be for one or more of the following reasons:

* Need to directly interact with H/W, like writing boot loader, device
  driver etc.
* Performance is critical.
* Portability across different hardware.
* Inter-operability with programs written in other languages.
* Vibrant ecosystem, due to its simplicity and brevity.
* Real time systems requiring predictable behavior.

Let us look at them one by one, though not necessarily in the same order.

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
default, it is really hard to shoot ourself on the foot as long as
we are writing safe code. And for H/W access we can restrict them into
separate functions and mark them unsafe.

Performance
-----------

Performance in `C` programs come from:

* Simple data types that can optimally be configured for cache hits,
  alignments, memory footprint etc.
  * Rust, the amazing type system of rust, when compiled, manages to
    reduce them to `C` like simplicity.
* No Garbage Collection (GC).
  * Rust, similar to `C`, does not have a GC by default, but at the same
    time programmers don't have to alloc/free memory. There are no
    dangling pointers and no memory leaks that are common to `C` programs.
* No hidden cost due to compiler introduced scaffolds.
  * Rust follows zero-cost-abstraction, programmers can enjoy
    the higher level abstractions in rust without worrying about hidden
    cost that might be introduced by compiler.
* A well aged compiler and language design.
  * Rust design include some of the latest, but mature, type system
    along with memory safety built into the language. And inspite of
    being a very young language its performance is comparable to `C++`,
    if not with `C`.

Portability
-----------

One of the initial purpose for designing the `C` language was portability,
which has two angle to it. One, programmers can write code without
worrying about machine instructions, or its design architecture. Second,
availability of a `C` compiler for pretty much every processor platform.

Rust uses LLVM as its backend for generating the machine code. And
LLVM can already compile to several processor platforms and has a vibrant
community. And when compared to `C`, Rust is far more agnostic to the
processor or its target platform. As added bonus, while Unix is the
favorite OS for `C` programmers (at least historically speaking), such OS
specific nuances does not stick into Rust programming.

Inter-operability
-----------------

Good amount of programs are written, document and distributed as libraries.
Inter-operability means, such libraries can be exported to other languages
through its FFI (Foreign Function Interface). And `C` is the first, and most
likely the only, language that most of the languages support in its FFI.
Personally, this ended up as the decided factor to pick Rust. After writing
couple of algorithms with Golang, I found it disappointing that I cannot make
them available for programmers in other languages.

Rust, by using `C` representation for its data format (using `repr` attribute)
and function-call-stack can be linked with other languages similar to a `C`
program. AFAIK C, C++ and Rust are the only ones that can be counted for
inter-operability.

Simple design
-------------

Often cited advantage of `C` is its simplicity for programming. For someone
who is already comfortable with micro-processors and computer architecture,
`C` is easy to learn.

Rust type system, functional paradigms in programming, its memory safety and
lifetimes, macro-system are new ideas for many programmers. Yes there
is a bit of learning curve before getting productive with Rust, but most of
the higher level abstractions, except trait-objects, are built on top of `C`
like simple design. The entire Rust reference-manual is around 100 pages.

Predictable runtime
-------------------

Often cited disadvantage of higher level languages like Haskell, Java,
Python etc. is that, their runtime execution is unpredictable and cannot
be used in real-time systems, where latency and response times are
critical.  Root cause of unpredictable latency primarily hinges on:

* Garbage collection.
* Pass by reference.
* Pointer indirection due to virtual-tables and other language level
  abstractions.
* Runtime Scheduler for green-threads compiled into the application.

Rust has strong ownership model to avoid Garbage collection. Rust
doesn't have green-threads and hence there is no scheduler compiled into
rust programs. Even if green-threads are supported in future versions of
Rust, it is most likely an opt-in feature. Rust uses Mono-morphisation
technique to avoid pass by reference, except in case of trait objects.
Trait objects do have virtual tables, but using trait objects have to be
explicit in Rust.

Bonus features in Rust programming
----------------------------------

* Amazing type system - data and behavior are cleanly separated.
* Enumerated type variants.
* Really hard to end up with segmentation faults.
* Facilitates concurrent programming without compromising on safety.
* Modules and crates for organizing rust code.
* Attribute system that facilitates build, versioning, packaging,
  distribution and installation.
* Rust standard library leans on functional paradigm.

Table of comparision
--------------------

![Rust Vs C](media/rust-over-c/rustvsc.png)

* <sub style="color: gray;"> C Macros are pre-processor directives for text substitution </sub>

[rust]: https://www.rust-lang.org
[java]: https://en.wikipedia.org/wiki/Java_(programming_language)
[python]: https://en.wikipedia.org/wiki/Python_(programming_language)
[js]: https://en.wikipedia.org/wiki/JavaScript
[haskell]: https://en.wikipedia.org/wiki/Haskell_(programming_language)
[ruby]: https://en.wikipedia.org/wiki/Ruby_(programming_language)
[golang]: https://en.wikipedia.org/wiki/Go_(programming_language)

