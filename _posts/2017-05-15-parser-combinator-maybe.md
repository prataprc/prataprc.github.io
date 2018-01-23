---
layout: post
title: "Parser combinator and maybe rule"
permalink: parser-combinator-maybe.html
---

Parser combinator is a technique to build top down parsing logic in any
language, for more detail on that refer to
[Parser Combinator][parser-combinator-link] wiki page, rest of this
article describe a use case with [goparsec][goparsec-link] tool written
in [golang][golang-link].

Following code uses two types of combinator logic, `And` and `Maybe`:

* `And` combinator forces that all three tokens should match.
* `Maybe` combinator gives an exception on the second token, which can be
  optional.

<script src="https://gist.github.com/prataprc/d8f1b6607c854fcfa7b651f648f75ffb.js?file=parsecmaybe.js"></script>

Prior to [this commit][this-commit-link], there was an issue with goparsec
tool, which failed to parse the second i/p text `text: "hello" false`:

```bash
text: "hello" 10 false
parsed 3 items
index:0 string
index:1 parsec.Terminal
index:2 parsec.Terminal
......
text: "hello" false
```

With a fix to goparsec tool, our parsec works fine with the second i/p text.

```bash
text: "hello" 10 false
parsed 3 items
index:0 string
index:1 parsec.Terminal
index:2 parsec.Terminal
......
text: "hello" false
parsed 3 items
index:0 string
index:1 parsec.MaybeNone
index:2 parsec.Terminal
```

Note that the second item, `index:1`, is parsed as parsec.MaybeNone, which
indicates that the second token was not present in the input text. Whereas the
first, `index:0` and the third, `index:2` nodes are parsed in same way as
that of the first i/p.

[parser-combinator-link]: https://en.wikipedia.org/wiki/Parser_combinator
[goparsec-link]: https://github.com/prataprc/goparsec
[golang-link]: https://golang.org/
[this-commit-link]: https://github.com/prataprc/goparsec/commit/f685ded37361150d354e52efaaf2aeb29d773e36
