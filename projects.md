---
layout: page
title: Active and archived work
permalink: projects.html
---

<a id="goto-github" href="https://github.com/prataprc">Goto github account</a>

All of my contributions are hosted in github, most of them are open-sourced
under permissive license like MIT or BSD. I have tried to classify
my activities and contributions as **active** and **archive**. Note that archived
project are not incomplete, most likely they have reached a certain state of
usability with fair amout of testing. Just that am not actively exploring future
ideas with archived projects.

Active projects (in rust)
-------------------------

Am most active with the following projects, contributions are very much welcome :)

**[json][git-jsondata]**, json toolkit tuned for big-data, document database.

**[xorfilter][git-xorfilter]**, faster and smaller than bloom and cuckoo filters,
for immutable set of keys.

**[read-only-btree][git-robt]**, key-value index using immutable, read only btree.

**[wral][git-wral]**, write ahead logging for rust applications.

**[ppar][git-ppar]**, persistent array using a variant of rope data structure.

**[ppom][git-ppom]**, persistent ordered map using left-leaning-red-black-tree.

**[cmap][git-cmap]**, concurrent unordered key-value map, support multi-writer concurrency.

**[mkit][git-mkit]**, collection of types and functions used by other libraries
and applications.

**[ixperf][git-ixperf]**, performance toolkit for indexing algorithms.

**[diskio][git-diskio]**, performance toolkit for storage devices.

**[ted][git-ted]**, vim inspired text editor, backed by [rope][rope-algo] data structure
for buffer management and [tree-sitter][tree-sitter] for syntax highlighting. There is
a long term plan to make this into a terminal tool kit for app-development using
buffers, syntax highlighting and events.

**[drand client in rust][git-drand-client]**, distributed randomness beacon client
for [drand.love][drand-love].

**[multiformats][git-multiformats]**, **[peer-id][git-peerid]**, **[cid][git-cid]**,
implement [multiformats.io][multiformats-io] in rust-lang. This specification is
part of the [ipfs-project][ipfs-io] which also define [peer-id][peerid-spec] and
[cid][cid-spec] specifications.

Golang
------

List of projects in golang. They are fairly tested and in usable state, though these
days I focus mostly on [rust-lang][rust-lang].

[Goparsec][goparsec-link], parser combinator library with standard set of
combinators, reg-ex based scanner and commonly used Terminal parsers..

[Gofast][gofast-link], high performance protocol in golang. For simple needs like
peer-to-peer, pipelining this is a good choice. For more complex requirement I might
suggest [quic][quic].

[Gson][gson-link], collection of JSON serialization, CBOR serialization and
[collation][collation] encoding for both JSON and CBOR.

[Monster][monster-link], production system in Go. Reverse of parsing,
given a BNF grammar generates text. Very useful in randomized generation of json values.
SQL queries, html urls and pretty much any thing that defines a shape in text.

[Golog][golog-link], logging library in golang, for golang.

[Gosettings][gosettings-link], settings and configuration for golang
libraries and applications.

Double entry accounting
-----------------------

I like [double-entry][double-entry] systems. Me being more familiar and comfortable with
terminal, I naturally found [ledger-cli][ledger] very attractive.

[Goledger][goledger-link], double entry accounting for currencies and commodities -
`Credit the giver, Debit the receiver`. When time permits I am planning to port this
to [Rust][rust-lang], if interested reach please [reach out](./connect.html). If you
are into scala or prefer JVM try [abandon][abandon].

[Tally2ledger][tally2ledger-link], tally is a popular accounting tool in India
_Tallyledger_ tries to convert books from tally format to ledger format. Note that,
AFAIK, [Tally][Tally] does not publish its formats officially, so it is my amateur attempt
to reverse engineer the format.

Sometimes, I wonder whether tech-world can come up with just a single idea to handle
data and information, like what double-entry did to accounting.

Python
------

A while back we tried to build an open collaboration tool for programmers,
[discover-zeta][zeta], as an alternative for [trac][trac], [source-forge][source-forge]
and [google-code][google-code], soon github came and proved its success. Before
halting the project I decided to fork out the developement stack as independant
libraries.

[Pluggdapps][pluggdapps-link], a component system in python much simpler than
[Zope][zope]. [Pluggdapps documentation][pluggdapps-doc-link] hosted in python
cheese shop.

[Tayra][tayra-link], create concise, beautiful and highly re-usable HTML
templates. [Tayra documentation][tayra-doc-link] hosted in python cheese shop.

[Tayrakit][tayrakit-link], widget toolkit using tayra.

[Eazytext][eazytext-link], wiki markup language, similar to [Markdown][markdown-link],
but provide more options to user at the expense of looking little cluttered.

[Pagd][pagd-link], static site generator, this site was generated using
it. [Pagd documentation][pagd-doc-link] hosted in python cheese shop.

All of them are in archive state. May be when internet matures into a truly
distributed network we may spawn a new avatar of discover-zeta based on
merkel-trees :) Meanwhile if you plan to fork the project and continue with the
development kindly [let me know](./connect.html).

Erlang
------

[Erlang][Erlang] is a nice language, whether used in production or not, I would
recommend programmers to take a peep at it for its concurrency, and the ideas
suggested in [open-telecom-platform][OTP]. If you like the idioms and ideas of Erlang,
but feel un-comfortable with its syntax check out [Elixir][Elixir].  I have listed
some of the projects I enjoyed implementing in Erlang and they are currently in archive
state.

[Sudoku][sudoku-link], sudoku puzzle generator and solver in erlang.

[Netscale][netscale-link], collection of distributed apps in erlang.

[Textmode][textmode-link], erlang + ncurses, terminal server for erlang
applications.


[rust-lang]: http://rust-lang.org
[quic]: https://quicwg.org
[collation]: https://prataprc.github.io/jsonsort.io
[drand-love]: https://github.com/prataprc/ted
[rope-algo]: https://en.wikipedia.org/wiki/Rope_(data_structure)
[tree-sitter]: https://tree-sitter.github.io/tree-sitter
[multiformats-io]: https://multiformats.io/
[peerid-spec]: https://github.com/libp2p/specs/blob/master/peer-ids/peer-ids.md
[cid-spec]: https://github.com/multiformats/cid
[ipfs-io]: https://ipfs.io/
[git-peerid]: https://github.com/bnclabs/ip-peerid
[git-cid]: https://github.com/bnclabs/ip-cid
[git-mkit]: https://github.com/bnclabs/mkit
[git-robt]: https://github.com/bnclabs/robt
[git-wral]: https://github.com/bnclabs/wral
[git-ppar]: https://github.com/bnclabs/ppar
[git-ppom]: https://github.com/bnclabs/ppom
[git-jsondata]: https://github.com/bnclabs/jsondata
[git-xorfilter]: https://github.com/bnclabs/xorfilter
[git-ixperf]: https://github.com/bnclabs/ixperf
[git-diskio]: https://github.com/bnclabs/diskio
[git-cmap]: https://github.com/bnclabs/cmap
[git-mkit]: https://github.com/bnclabs/mkit
[git-multiformats]: https://github.com/bnclabs/multiformats
[git-drand-client]: https://github.com/prataprc/drand-rs
[git-ted]: https://github.com/prataprc/ted

[goparsec-link]: http://github.com/prataprc/goparsec
[monster-link]: http://github.com/prataprc/monster
[gofast-link]: http://github.com/bnclabs/gofast
[gson-link]: http://github.com/bnclabs/gson
[golog-link]: http://github.com/bnclabs/golog
[gosettings-link]: http://github.com/bnclabs/gosettings

[double-entry]: https://www.investopedia.com/terms/d/double-entry.asp
[ledger]: https://www.ledger-cli.org
[Tally]: https://tallysolutions.com
[goledger-link]: http://github.com/tn47/goledger
[tally2ledger-link]: http://github.com/tn47/tally2ledger
[abandon]: https://github.com/hrj/abandon

[zeta]: https://github.com/prataprc/zeta
[trac]: https://trac.edgewall.org
[source-forge]: https://sourceforge.net
[google-code]: https://code.google.com/archive
[pluggdapps-link]: http://github.com/pluggdapps/pluggdapps
[tayra-link]: http://github.com/pluggdapps/tayra
[tayrakit-link]: http://github.com/pluggdapps/tayrakit
[pagd-link]: http://github.com/pluggdapps/pagd
[eazytext-link]: http://github.com/pluggdapps/eazytext
[pluggdapps-doc-link]: http://pythonhosted.org/pluggdapps
[tayra-doc-link]: http://pythonhosted.org/tayra
[pagd-doc-link]: http://pythonhosted.org/pagd
[markdown-link]: https://en.wikipedia.org/wiki/Markdown
[zope]: https://pypi.org/project/Zope


[Erlang]: https://www.erlang.org
[OTP]: https://en.wikipedia.org/wiki/Open_Telecom_Platform
[Elixir]: https://elixir-lang.org
[sudoku-link]: http://github.com/prataprc/sudoku
[textmode-link]: http://github.com/prataprc/textmode
[netscale-link]: http://github.com/prataprc/netscale
