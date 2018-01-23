---
layout: post
title: "C - spartan among languages"
permalink: C-spartan-among-languages.html
---

C as popularly called, is a spartan language that requires lot of self
discipline to master it and make use of it. The absolute freedom and the
straight interaction with hardware demands lot of care, insight and discipline.

Tread with care
---------------

*Pointers*. C language directly relates to the design of modern 
micro-processor and its stored program architecture. Be it data-types,
composite-types or functions and code-blocks, C language abstracts the
building blocks of today's micro-processors and its pointer concept provide a
powerful way to introspect everything that is stored.

*Lack of constructs*. This can also be called as lack-of-pretense. Many
concepts and constructs that we observe in modern languages lack support
from its hardware counter-part, there by, a software run-time is added to
augment the hardware and loose some performance in doing so.
Nevertheless, present constructs and concepts provided by C are simply not
enough for building large programs.

*Preprocessors*. Pre-processors provide portability, they also provide 
macros and in some cases they enable programmer to control how the program
gets compiled. But for those who maintain a code base in C, they had to parse
two languages in their mind and very many architectures along with that.

*Portability*. A programmer in 1980s would have made portability as a
winning advantage for C language. Faster processors, mature virtual machines,
dynamic translation have made languages like Python, Haskell, Java and Erlang
as reasonable options for programmers. There is a section which cover some of
the "features" in C language that makes it less portable ;).

*Undefined features*. If you get a chance, compile and run the following code
snippet on Irix, GCC and SPARC machines. You will know what "Undefined feature"
means.

```C
void myfunc(void) {
    int i = 10;
    printf("%d %d %d %d %x ", i++, --i, ++i, ++i, i++ );
}
```

And, there are quite a few "features" like this.

Still ticking around !
----------------------

No better language to do system programming (kernel, drivers) across a variety
of computer architecture. And if an attempt is made to create a new language
for this domain - it will more or less look like C. That is, unless otherwise
we change the fundamentals of processor-design.

*Performance*. C language directly maps down to stored program architecture
and hence a popular choice for microprocessor vendors to tune their processor's
performance trade-offs. Since most of the CPU intensive algorithms are
available in C, it becomes another reason for processor engineers to use C
algorithms to measure their design trade-offs.

*Popularity*. A good example how a language with right mix of abstraction,
power and portability can capture programmers imagination.

*Ecosystem*. The tool-chain, debugger, IDE, editors are best available for C.
Probably Java programmer could also make that claim, but I don't know any
other language which could measure up in providing that sort of
developer/development ecosystem.

Is C Portable ?
---------------

Not when you compare it with Python or Haskell.

*Endianness*. Yes, for reasons that dates back to antiquity, C-programmers must 
worry whether their data is stored in big endian or little endian.

*Size of data-types*. The program/programmer cannot make assumptions on the
size of the basic data types like int, short, long, char, pointer etc...

*Memory alignment*. Some processors require that Half-word, Word, Dword
memory are accessed with aligned address. That is a half-word (2 byte) memory
access should be only through address which are multiples of 2, a word (4
byte) memory access should be only through address which are multiples of
4 and so on.

*Structure packing*. Based on memory alignments and packing directives, the way
structure members are packed and padded can vary.

*Pointer arithmetic*. This can break anything.

*Compiler extensions*. Fortunately or unfortunately C was allowed to evolve
through multiple vendors. And not two compilers play the same music. So a
program can be non-portable across compilers even on the same architecture.
Yep! so much for portability !!

*Binary and binary files*. Another spartan feature of C program is the
control it can provide - on where to store sections of data and code. A C
programmer is not yet a complete C programmer without learning linker scripts
and the ELF file format.

*Application Binary Interface*. The problem is C language does not have one,
and it is left to the compiler to decide on that. So it is better to know
how function calls are made and return values passed back for specific
compiler tool chains.

And there is a non-exhausting list of portability problems.

All said, C cannot be replaced and the claims like C has outlived its need are
false. We can choose other languages if they suit better, but on any day, I
would want one language which gives enough power to the programmer. Like C.
Let us just make ourselves more spartan like.
