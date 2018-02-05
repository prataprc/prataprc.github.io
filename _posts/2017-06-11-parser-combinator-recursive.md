---
layout: post
title: "Parser composition for recursive grammar"
permalink: parser-combinator-recursive.html
---

Input text, sometime, have recursive patterns. For example:

```python
10 * ((20 + 30) * 40)
```

Let us try to build a plain text calculator, where input is an expression of
arithmetic operations on numbers. Operations include addition, subtraction,
multiplication and division, in which multiplication and division take higher
precedence over addition and subtraction.

```yacc
expr:      term | expr '-' term | expr '+' term
term:      factor | term '*' factor | term '/' factor
factor:    NUMBER | '(' expr ')'
```

Above YACC grammar can parse the calculator text. Note that the grammar
definition involves several recursive elements: like, `expr` is defined
using `expr`. When we try to port this grammar to construct parser combinator
we will end up with **infinite recursion** . Instead we can re-work the grammar
in such a way that recursive definition of grammar, will quickly be resolved
by presence or absence of a terminal token. Here is an example:

```text
expr  -> sum
prod  -> value (mulop value)*
mulop -> "*" |  "/"
sum   -> prod (addop prod)*
addop -> "+" |  "-"
value -> num | "(" expr ")"
```

Above grammar also defines `expr` using `expr` albeit indirectly. We can
now proceed to construct our simple parsers that can parse terminal tokens.

```go
var openparan = parsec.Token(`\(`, "OPENPARAN")
var closeparan = parsec.Token(`\)`, "CLOSEPARAN")
var addop = parsec.Token(`\+`, "ADD")
var subop = parsec.Token(`-`, "SUB")
var multop = parsec.Token(`\*`, "MULT")
var divop = parsec.Token(`/`, "DIV")
```

Let us do some trivial composition.

```go
// addop -> "+" |  "-"
var sumOp = parsec.OrdChoice(one2one, addop, subop)
// mulop -> "*" |  "/"
var prodOp = parsec.OrdChoice(one2one, multop, divop)
```

Then comes a non-trivial composition, where three compositions `value`,
`sum`, and `prod` refer each other. To handle situation like this
the standard combinators available in goparsec can compose with `Parser`
and/or `*Parser`. This gives user the ability to forward declare
a parser and use its reference for composition, while the actual definition
for that parser can happen later.

```go
// Forward declaration
var prod, sum, value parsec.Parser // circular rats

// value -> "(" expr ")"
var groupExpr = parsec.And(exprNode, openparan, &sum, closeparan)
// (addop prod)*
var prodK = parsec.Kleene(nil, parsec.And(many2many, sumOp, &prod), nil)
// (mulop value)*
var valueK = parsec.Kleene(nil, parsec.And(many2many, prodOp, &value), nil)
```

And finally we can tie them all together:

```go
// Circular definitions come to life

// sum -> prod (addop prod)*
sum = parsec.And(sumNode, &prod, prodK)
// prod-> value (mulop value)*
prod = parsec.And(prodNode, &value, valueK)
// value -> num | "(" expr ")"
value = parsec.OrdChoice(exprValueNode, intWS(), groupExpr)
// expr  -> sum
Y = parsec.OrdChoice(one2one, sum)
```
