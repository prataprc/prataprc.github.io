---
layout: post
title:  "Rust Cookbook"
permalink: rust-cookbook.html
published: false
---

()
u8 u16 u32 u64 u128
i8 i16 i32 i64 i128
f32 f64
true false
str String
[T; N] [T] Vec<T>

.. M.. ..N M..N ..=N M..=N

for in {}
if {} else if {} else {}
if let {} else if let {} else {}
while {}
while let {}
loop {}
r#<keyword>
crate::
use
mod
extern

process:
bors

tools:
rustfmt rustfix clippy rustdoc rustup rls lldb/gdb

traits:
std::alloc::System

attributes:
#[global_allocator]
#[panic_handler]
#![no_std]

crates:
proc_macro core std alloc test
libsyntax
syn
quote

no_std libcore #[panic_handler]

concepts:
existential types; universal types; impl Trait.
https://github.com/rust-lang/rfcs/blob/master/text/2388-try-expr.md
https://github.com/rust-lang/rfcs/blob/master/text/2394-async_await.md


Big use case of ``impl Trait``
fn returns_closure() -> impl Fn(i32) -> i32 {
    |x| x + 1
}
However, impl Trait can't be used inside implementations of traits,
nor can it be used as the type of a let binding or inside a type alias.
Some of these restrictions will eventually be lifted. For more
information: https://github.com/rust-lang/rust/issues/34511
