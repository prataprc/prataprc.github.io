---
layout: post
title:  "Open source licensing"
permalink: open-source-licensing.html
published: false
date: 2019-01-17
---

Open source code is by far the most transparent and inclusive
means of building trust among its authors, contributors, business
and end-users. In this post I will be making a case for different
open source licenses under different scenarios.
[Open source software licenses][link2] slide was useful to
understand the relationship between different licenses, and
served as inspiration for this post.

<br>

![OSS Compatibility](media/licenses/floss-license-slide-image.png)

<span style="font-size: 0.7em;"> Image courtesy - [here][link2] </span>

<br>

Above chart describe compatibility level between some of the most
popular open source licenses.

> "Apache 2.0" licensed software and "GPLv2+" licensed software can
> both reach "GPLv3 or GPLv3+", so they can be combined using
> "GPLv3 or GPLv3+"

**Permissive** means allowing user to do what ever necessary for
the success of business, except by suing the authors and contributors.
And **protective** means protecting contributors from their work
becoming proprietary in a business process.

Different categories can be described as:

<span style="color: red">**Permissive licenses**</span>:
Permit the software to become proprietary. In
essence these licenses allow users to do anything with the distributed
software, without troubling the original author, like the **MIT**
license. MIT license can easily combine with 3-Clause BSD (aka BSD new)
forbidding the use of author's name to endorse or promote the product
without permission. Among the permissive licenses Apache-2.0 provides
patent grant protection for both side, the contributors and licensee.

<span style="color: red">**Weakly protective**</span>:
Prevent software library from becoming proprietary,
yet permit it to be part of a larger proprietary program.

<span style="color: red">**Strongly protective**</span>:
Prevent software from becoming proprietary.

<span style="color: red">**Network protective**</span>:
With the advent of server and cloud applications user can modify
open source code and host them as services for commercial use.
GNU Affero GPL license protects authors and contributors by forcing
users to publish their derived work even it is hosted locally and
accessed by their users over the internet.

For more detailed difference between various license, check out this
[wiki-link][table1].

A short etymology of terms:

* **source code**: also called source base, make up a project,
that can be distributed as library or application binary, or in its
source form with guidelines to generate the binary.
* **upstream**: one or more authors who conceive a project, maintain
the source base, decide its future course.
* **downstream**: one or more contributors who provide ideas, patches
and features to upstream, most likely resulting in better quality of
the final product.
* **dependency**: all other source bases and/or binaries that are
required by this project to produce a final binary, either as a library
or application.
* **users**: all consumers of a software product either for private
or commercial purpose, either by linking with them or deriving from them,
either for self-use or distributing it to third party or hosting them
on network.

Note that, above descriptions only serve the purpose of introduction
and not to be interpreted in legal terms.

<h4>Bootstrapping a project</h4>

Bootstrapping a open source project means, promises about
publishing the source code, encouraging fellow programmers to use them
and contribute back, and protecting such efforts.

When an open source project is bootstrapped by an individual, one of
the many _protective_ license is suitable.

When an open source project is bootstrapped by commercial organization
or startup, one of the many _permissive_ license is suitable.

<h4> Authors parting ways </h4>

More than one person can come together to bootstrap a project. In
such cases, there might be eventualities where authors decide to
part ways. And the choice of what they want to do after forking
the project can be severely limited by the choice of their license.

For instance if both party decide to take their project without
affecting contributors to the project, business and end-users
then Affero GPL would be a better choice.

But when one of them decide to host the binary on internet
providing commercial services, may be GPL is good enough.

And if either one of them decide to take the proprietary route,
for one reason or the other, a permissible license works better.

<h4> Business depending on open source </h4>

There are more number of business depending on open source
products that the number of business creating and selling open
source products.

For business depending on open source product it would be,
at best, annoying and, at worst, catastrophic when they find
them going proprietary.

<h4> Competition between business </h4>

When business is using open source products to build a larger
product and/or derive from open source product to better satisfy
its customers, it would be like giving a free lunch to its competitors,
when they are forced to release the portions of code that they
developed in-house. In such cases almost always a permissible license
is preferred.

**In almost all cases end-user doesn't care about the license or copyright**

And,

**In almost all cases end-user care about quality and value-for-money**


[link1]: https://janelia-flyem.github.io/licenses.html
[link2]: https://dwheeler.com/essays/floss-license-slide.html
[table1]: https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses#General_comparison
