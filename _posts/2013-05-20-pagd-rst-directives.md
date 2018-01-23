---
layout: post
title: "Pagd custom directives"
permalink: pagd-rst-directives.html
---


Read this [article](./blog-with-pagd.html) to know how to set up your blog
site with [pagd][pagd-link] and host it using [github][github-link].
Rest of the article explain couple of restructured directives that can be
used while authoring articles and generating a site with pagd.

Source code highlighting
------------------------

If you are a programmer or some-one who wants to author articles about
programming and languages - it is likely that you will be including snippets of
code in your article. In such cases wrap your code-snippets with
`code-block` rst-directive, like,

```rst
.. code-block:: c

    void myfunc(void) {
        int i = 10;
        printf("%d %d %d %d %x ", i++, --i, ++i, ++i, i++ );
    }
```

while generating your web site using [pagd][pagd-link], above block of code
will be rendered like,

```c
void myfunc(void) {
    int i = 10;
    printf("%d %d %d %d %x ", i++, --i, ++i, ++i, i++ );
}
```

Youtube directive
-----------------

There were many occasions we wanted to refer you-tube links that can play
inside our page. For such occasions,

```rst
.. youtube:: 7-qGKqveZaM
```

You can also apply custom styling for youtube widgets in your site my
modifying the CSS styling for `div.rst-youtube` selectors inside
`media/myblog.css` file.

Gallery directive
-----------------

Let us say you have a bunch of charts that you would like to present them as
image gallery for your readers,

```rst
.. gallery:: My collection of charts
    media/sudokucharts/nosmp.png
    media/sudokucharts/smp2.png
    media/sudokucharts/smp4.png
    media/sudokucharts/par.png
    media/sudokucharts/conc.png
```

[pagd][pagd-link] uses [magnific-popup][magnific-popup-link] jquery plugin to
show image galleries within HTML pages. They have excellent documentation and
there are many ways to customize the plugin - which you can learn from their
project site. There is also a bunch of CSS selectors that are available in
`media/myblog.css` with which you can do some basic customization as well.

Gist directive
--------------

If you have code gist in github and you want to embed them inside your
article, use the following directive,

```rst
.. gist:: prataprc/5843946.js
```

where `prataprc` is the user-name and it will expand to full URL - 
https://gist.github.com/prataprc/5843946.js.

To include a specific file from the gist,

```rst
.. gist:: prataprc/5843946.js?file=caveat7.js
```

This will embed only `caveat7.js` file inside your article.

[pagd-link]: http://pythonhosted.org/pagd
[tayra-link]: http://pythonhosted.org/tayra
[github-link]: http://github.com
[mailing-link]: http://groups.google.com/group/pluggdapps
[magnific-popup-link]: https://github.com/dimsemenov/Magnific-Popup
