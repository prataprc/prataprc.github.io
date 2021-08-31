---
layout: post
title:  "Release checklist for rust crates"
permalink: rust-crates-release-checklist.html
date: 2021-03-11
category: tech
---

Release when ready, release frequently. Essentially means each cycle of
conception to completion shall be short and the cycles themself shall
repeated often. Following is a checklist of things todo before making
a release.

Rust crates come in two form, executable-binary and library.

Release checklist for rust library
----------------------------------

* Look for `TODO` comments and `todo!()` macros, move them to issues or just
  collect them in a separte TODO.md file under repository root.
* Review macros - `println!()`, `panic!()`, `unreachable!()`,
  `unimplemented!()`. Make sure they are obsolute necessary. Preferably
  replace `println!()` with [log facade][log-facade].
* Check for `dead_code`.
* Check for ignore test cases and if present add them to CI.
* Cleanup unwanted `fmt::Debug` and `fmt::Display` traits from types.
* Remove trait contraints on type and implementations, as much as possible.
  * Use MaybeUninit, instead of `Default`.
  * Use move-semantics instead of `Copy` and `Clone` traits.
  * Reduce the function specific trait constraints to function-signatures.
  * Combine functions with common trait constraits into single `impl{}`.
* Replace `assert!()` with Error return or `debug_assert!()`.
* Calls to `unwrap()`/`expect()` can panic. Make sure the panic is intended,
  preferrabley replace unwrap() with expect() call.
* Review `ok()` method on `Result` and `Option` types. They silently ignore errors.
* `"as"` type casting is dangerous. Replace them with `try_into()` or
  `try_from()` call.
* Review `unsafe { .. }` blocks and document them.
* README.md must be present, and shall contains
  * Link to rust-doc.
  * Short description.
  * Useful links.
  * Contribution guidelines.
* Makefile, the g(old)en simplicity from yester-years. All the make targets
  shall pass with 0 warnings and 0 errors.
  * __clean__ target, remove file created by [CI][ci] scripts.
  * __build__ target, follow the [build matrix](#build-matrix) and add them
    under this target.
  * __prepare__ target, run the continuous-integration scripts as part of
    release preparation.
  * __flamegraph__ target, to generate flamegraph using
    [cargo-flamegraph][cargo-flamegraph]
  * __spellcheck__ target, to check for spelling mistakes in rustdoc using
    [carg-spellcheck][cargo-spellcheck]
* Documentation Review.
* Add release notes in `RELEASE.md`.
* Bump up the version:
  * __major__: backward incompatible API changes.
  * __minor__: backward compatible API Changes.
  * __patch__: bug fixes.
* If CI is setup, then make sure that latest commit upto release preperation has passed.
* Create a git-tag for the new version.
* Cargo publish the new version.

We may have to install [cargo-flamegraph][cargo-flamegraph] and
[cargo-spellcheck][cargo-spellcheck] via `cargo install` command.

Declare for
-----------

Wherever applicable declare a library for the following features.

* Zero heap allocations.
* Zero dependencies.
* No-panic.
* No-unsafe.
* Depth-limited recursion (or) No-recursion.
* `no_std` compatible.
* `WASM` compatible.

Project layout
--------------

* __Cargo.toml__, cargo manifest file.
* __check.sh__, CI script for testing.
* __LICENSE__
* __Makefile__, CI script.
* __perf.sh__, CI script for benchmark and perf-measurements.
* __README.md__
* __RELEASE.md__, release notes for each release.
* __rustfmt.toml__, configuration for rustfmt.
* __src__, library
  * __src/bin__, binary-tools to support/work-with library artifacts.
* __TODO.md__

This is based on cargo's recommended [project-layout][project-layout].


Build matrix
------------

|                  | build | test | bench | doc | clippy
|------------------|-------|------|-------|-----|-------
|stable-dev        |  ✓    |  ✓   |       |     |
|stable-release    |  ✓    |  ✓   |   ✓   |  ✓  |   ✓
|nightly-dev       |  ✓    |  ✓   |       |     |
|nightly-release   |  ✓    |  ✓   |   ✓   |  ✓  |   ✓

Rustfmt
-------

Following is my general preference for [rust-fmt][rustfmt-cfg].

```toml
max_width = 90
```

[rustfmt-cfg]: https://rust-lang.github.io/rustfmt/?version=v1.4.36&search=
[cargo-flamegraph]: https://github.com/flamegraph-rs/flamegraph
[cargo-spellcheck]: https://github.com/drahnr/cargo-spellcheck
[log-facade]: https://github.com/rust-lang/log
[ci]: https://en.wikipedia.org/wiki/Continuous_integration
[project-layout]: https://doc.rust-lang.org/cargo/guide/project-layout.html
