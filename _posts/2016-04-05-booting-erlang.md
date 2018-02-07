---
layout: post
title: "Erlang: Overhead of booting Erlang VM"
permalink: booting-erlang.html
---

Wanted to measure the overhead of booting an Erlang virtual machine, do
nothing and shut it down.

These measurements are on **2Ghz Core-2 Duo desktop machine running ubuntu
12.04 LTS**.

```bash
$ /usr/bin/time -p erl -noinput -noshell -s init stop
real 1.13
user 0.14
sys 0.01
```

Looks like it takes about 1.130 Seconds - this includes both booting and shutdown
times. `init:stop/0` is the proper way to shutdown Erlang virtual machine
and we don't really know where most of the time went, whether in booting the
VM or to shutdown the VM. To figure this out let us try using another method,

```bash
$ /usr/bin/time -p erl -noinput -noshell -s erlang halt
real 0.14
user 0.13
sys 0.01
```

`erlang:halt/0` abruptly shutdowns the VM, the above numbers give us an idea
on how-long it takes to boot Erlang-Virtual-Machine.
