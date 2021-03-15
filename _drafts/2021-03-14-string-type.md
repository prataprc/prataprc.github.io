---
layout: post
title:  "The infinite wisdom of string type"
permalink: infinite-wisdom-of-string-type.html
date: 2021-03-14
category: tech
---

This article is for programmers, about programming language.

It seems, the basic unit of accessing memory, in conventional CPUs,
is 8-bits. If you have some background in computers you might know that
a single bit is binary representation of numeric-0 or numeric-1 and by
positionally extending them we can write-down any numeric value using 1s
and 0s. Now back to 8-bits. We now know why most programming-languages
have `u8`, `uint8` or something similar as basic type - to repesent 8-bit
number. But then, there is a problem, using 8-bits we are limited to numbers
between 0 to 256. No worries, we invented a new type called `u16` a
16-bit number type and started calling it as [word][word]. As the scope of
computation kept increasing, CPU design kept upgrading, so did
their word size, to 32-bit and later 64-bit. Now we have two more new
types, `u32` for 32-bit number, `u64` for 64-bit number. But the problem
with numbers did not stop here, we wanted negative numbers and we invented
complementary types `i8`, `i16`, `i32`, `i64`.

If I have to sum up the entire paragraph above, in simple mathematics, we
were essentially trying to count numbers in forward and then in backward.

Did we succeed ? Not really, the problem of numbers is far from over.
We still got big-numbers, rational-number, irrational-numbers,
complex-numbers and more. I am sure we will keep inventing new types.

And that is how the science of computing kept inventing types for what
oridinary people would be satisfied to call as numbers. And the same science
in its infinite wisdom spanning the entire universe, its big-bang and
beyond, decided that all the languages of the past, present and future,
spoken and will be spoken, by ordinary people, shall need one and only one
type for any programming language. And christened it as string type.

Imagine this,

Mom (over the phone): Dear, the computer hung on me once again !
Son: No worries Mom, tell me the string displayed on the screen ?
Mom: Er tell what ?
Son: What is the string ahem .. what is the text displayed on the screen ?

It is naive to think that plain-text after getting processed through a Phd
in Category theory would still be allowed to call as plain-text.
Surely our physicist must have experienced a similar dilemma when
they figured out how our universe works, "string theory". From indigestion
to motion of planets the word "string" must be having a air of philosophical
supremacy to it.

Now that we have invented the "string-type" we must start rallying our
Phds and wanna-be Phds to start the laborious process of cutting and chopping
the symbols of world languages, into glyphs and graphemes, assigning them
numeric-values, putting them in a table, and define possible ways of joining
them. After all the future of the world 

[word]: https://en.wikipedia.org/wiki/Word_(computer_architecture)
