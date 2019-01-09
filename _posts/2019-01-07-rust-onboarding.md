---
layout: post
title:  "Rust Onboarding"
permalink: rust-onboarding.html
published: false
date: 2019-01-07
---

Often raised complaint with rust is its learning curve. Yes, the
learning curve for Rust is pretty steep and this short guide is
meant to ease the difficulty. Nevertheless one should remember this
- [No gain without pain][wiki1].

When learning languages like [Python][python], [Golang][golang], we
can start with values, types, literals, loop constructs, branch
constructs, functions and arguments without worrying about unique
and advanced features offered by them. Then, to get productive, we
move on to standard-library. And as we work with the language we
slowly digest the advanced and exiting features offered by them, to
write idiomatic and high performance code.

**With Rust**,

* Many of the features that one might expect as part of the language
  are actually implemented as part of the std-lib.
* Features like type-parameters and traits are first class citizens,
  which means, even built-in types and standard libraries
  are tightly weaved with standard traits and parametrised APIs.
* Stdlib is heavily influenced by functional programming, but it do not
  have to be like that.
* And most difficult part, at-least for me, is that we often
  find circular dependency of abstractions. Typically it is easy if
  abstractions/features are stacked on top of each other, unfortunately
  that is not the case here.
* Borrow checker interferes a lot in the program / compile cycle.
  Because it is an unique feature of rust that comes into play even with
  basic rust programming and it takes time to internalized the
  borrow-checker rules.

Although it might look cumbersome at first, we might find more than one
reason to call them as “rightly done”.

My tip would be -

* To follow through [Rust-book][book] and [Rust-examples][examples].
* Don’t touch the std-lib for now.
* Start solving simple problems from places like [project-euler][euler],
  [exercism][exercism] and [Advent of code][aoc].
* Start playing with advanced features of Rust.
* Improve your solutions (adventof-code/euler/exercism) with better
  abstractions offered by Rust.
* Move on to standard-library.
* crates.io comes much later.

Yes lot of patience required. For some it would be weeks, others it might be
months. Either way a stream of “aha” moments will come and a rust-mechanic
shall be born

[wiki1]: https://en.wikipedia.org/wiki/No_pain,_no_gain
[python]: https://en.wikipedia.org/wiki/Python_(programming_language)
[golang]: https://en.wikipedia.org/wiki/Go_(programming_language)
[book]: https://doc.rust-lang.org/book/index.html
[examples]: https://doc.rust-lang.org/rust-by-example/index.html
[euler]: https://projecteuler.net
[exercism]: https://exercism.io
[aoc]: https://adventofcode.com/
