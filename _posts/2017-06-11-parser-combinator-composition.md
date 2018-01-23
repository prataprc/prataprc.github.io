---
layout: post
title: "Parsing by composing functions"
permalink: parser-combinator-composition.html
---

By far the easiest way to write parser is by matching input text
as terminal nodes and then composing a tree of terminal and non-terminal
nodes. Terminal nodes, the leaf nodes, actually match the input
text, while Non-Terminal nodes are composed using Terminal nodes.

If values can be composed together to create higher ordered values, as in
Terminal nodes and Non-Terminal nodes, then, the same can be modeled with
functions. That is, we define simple functions and compose them together to
create a higher order function. The simple functions, called terminal
parsers, match input text.

I guess that is enough of theory, let us look at an example:

```log
64.242.88.10 [07/Mar/2004:16:05:49] GET,/index.html,401,1234
```

Above line is pulled out of a log file. There is a format to this line,
with following components: `(ip, timestamp, comma-separated-values)`

**parsing ip**

Format of ip is: <int>"."<int>"."<int>"."<int>, which can be parsed as:

```go
ydelimit = parsec.Atom(".")
yip := parsec.And(
    nil,  // Nodify
    parsec.Int(),
    ydelimit, parsec.Int(),
    ydelimit, parsec.Int(),
    ydelimit, parsec.Int(),
)
```

* `parsec.Atom()` will try to match the input text with `.`, which is
  the argument passed to construct the Atom parser.
* `parsec.Int()` returns a parser that will match the input text for
  integer. It is same as constructing parser with
  `parsec.Token(`-?[0-9]+`, "INT")`
* `Atom`, `Int`, `Token` are some of the standard parser constructors
  supplied by goparsec.
* Subsequently, we can combine the terminal parsers using `And` combinator.
* The first argument, passed as `nil` here, is for supplying a callback
  function. Arguments to `And` combinator tells us that, it shall first
  try to match an integer, and then a `.`, and then an integer, and then
  a `.`, and then an integer, and then a `.`, and then an integer.
* After every match, the cursor in the input text will move forward, but only
  if there is a match.

**Nodify**

What happens after all the parsers supplied to the And combinator succeed
in matching the input text ?

The first argument, called Nodify callback, if not nil, will be dispatched.
The signature of Nodify is:

```go
type Nodify func(nodes []ParsecNode) node ParsecNode
```

The array `nodes` carry a node item for each matching parser supplied to the
And combinator. In this case, len(nodes) will be 7. Nodify callback is user
supplied function and it is up to the user to decide what to do with nodes, and
finally a node item returned. This node item, typed as ParsecNode, can be
anything; it is just an alias for `interface{}`.

If our application is going to consume the **ip** as string, then we can use
the Nodify callback to do some interesting stuff:

```go
tostring := func(nodes []ParsecNode) node ParsecNode {
    s := ""
    for _, node := range nodes {
        s += node.(*Terminal).Value
    }
    return s
}
yip := parsec.And(
    tostring,
    parsec.Int(),
    ydelimit, parsec.Int(),
    ydelimit, parsec.Int(),
    ydelimit, parsec.Int(),
)
```

Here we are extracting the value of each terminal and concatenating it to
create the full ip address and return the string as ParsecNode.

**timestamp**

For time-stamp, we can't match the string as it is because other log lines,
in the same file, will have different time-stamp values. But the time-stamp
has a pattern: `\[[0-9]{2}/[a-zA-Z]{3}/[0-9]{4}:[0-9]{2}:[0-9]{2}:[0-9]{2}\]`

```go
ytm := parsec.Token(
    `\[[0-9]{2}/[a-zA-Z]{3}/[0-9]{4}:[0-9]{2}:[0-9]{2}:[0-9]{2}\]`,
    "TIMESTAMP")
```

`ytm` can parse any time-stamp in the log file as long as it follows the
same pattern.

**comma-separated-values**

Parsing comma separated values can be more complex, but that gives us the
opportunity to learn more about parsec.

```go
vector2scalar := func(nodes []parsec.ParsecNode) parsec.ParsecNode {
    return notes[0]
}
concat := func(nodes []parsec.ParsecNode) parsec.ParsecNode {
    s := nodes[0].(string)
    s = s[1 : len(s)-1]
    return s
}
ystr := parsec.And(concat, parsec.String())
yatom := parsec.Token("[a-zA-Z][a-zA-Z0-9_\.-]+", "ATOM")
yterm := parsec.OrdChoice(vector2scalar, ystr, yatom)
ycomma := parsec.Token(`,`, "FIELDSEP")
ycsv := parsec.Kleene(nil, parsec.Maybe(maybenode, yterm), ycomma)
```

Values can be one of the following:

* Double quoted string. Here, we can find a use case for Nodify with ystr,
  the Nodify callback prunes away the beginning quote, end quote and
  return the golang string as ParsecNode.
* An integer value.
* An atom of alpha numeric characters including special chars `_.-`.
  Atom always start with lower case or upper case alphabet.

In the above parsing logic, values are parsed as yterm. Since a term
can be one of the value described above, we use OrdChoice.

**Note that there is an ambiguity here**, between second type of value,
an Integer and third type of value, an Atom. In such cases, we should
compose the parser in such a way that, more specific parsers are tried
before trying more generic parsers. Although OrdChoice parses one of
the value as ParsecNode, it is returned as an array of []ParsecNode
with arity one. This is to keep it consistent with rest of the
combinators like And, Kleene, Many. To unwrap the single item in the
array we are once again using a nodify callback.

And finally we tie them up using the Kleene combinator. Kleene is used
because we expect ZERO or more terms in the input. Combinators like
Kleene and Many can take two parser, the first one parses
the input for the actual value and the second one parses the separator
token. In our case the separator token in a COMMA `,`. Kleene will
repeatedly apply the two parsers until they fail matching the input, at
which point all o/p from the first parser will be collected in an
array, of []ParsecNode, and dispatched to the nodify callback and/or
returned back.

**A note on Maybe:** If input contains a string like
`GET,index.html,,`, where the term can be empty, we still want the first
parser to succeed so the Kleene can continue matching the remaining string.
If indeed the input contains an empty term then Maybe combinator that wraps
the term will return ParsecNode as MissingNone. And the final []ParsecNode
returned by Kleene will contain MissingNone for all missing terms.

```go
text = `64.242.88.10 [07/Mar/2004:16:05:49] GET,"/index.html",401,1234`
y := parsec.And(nil, yip, ytm, ycsv)
scanner := NewScanner([]byte(text))
node, scanner := y(scanner)
```

So far we have only constructed parser functions, by composing simple
parsers to create complex parser, using one of the Combinators like
And, OrdChoice, Kleene, Many, Maybe. To actually parse the text we will
have to use a scanner, that implement parsec.Scanner{} interface.
Goparser provides a simple scanner constructed by calling `NewScanner`.
