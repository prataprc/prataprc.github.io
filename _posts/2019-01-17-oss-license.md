---
layout: post
title:  "Open source licensing"
permalink: open-source-licensing.html
published: true
date: 2019-01-17
---

Open sourcing code is by far the most transparent and inclusive
means of building trust among its authors, contributors, business
and end-users. In this post I will try making a case for different
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
essence these licenses, like the MIT license, allow users to do
anything with the distributed software, without troubling the original author.
MIT license can easily combine with 3-Clause BSD (aka BSD new) license
that forbids user from using the author's name, to endorse or promote the
product without permission. Among the permissive licenses Apache-2.0 provide
patent grant protection for both side, the contributors and licensee.

<span style="color: red">**Weakly protective**</span>:
Prevent software library from becoming proprietary,
yet permit it to be part of a larger proprietary program.

<span style="color: red">**Strongly protective**</span>:
Prevent software from becoming proprietary.

<span style="color: red">**Network protective**</span>:
With the advent of server and cloud applications, user can modify
open source code and host them as services for commercial use.
GNU Affero GPL license protects authors and contributors by forcing
users to publish their derived work even though it is hosted locally and
accessed by their users over the internet.

A detailed comparison between different licenses can be found in this
[wiki-link][table1].

A short etymology of terms:

* **source code**: also called source base can be distributed as
library or application binary, or in its source form with guidelines
to generate the binary.
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

<h4>Hobby projects</h4>

A vast majority of open source projects, under [github][github] and else
where, start as hobby projects. It is an excellent way to practice
programming and gain experience with technology. Hobby projects tend to
evolve through what is popularly called as [forking][forking].

Having a permissive license for hobby projects encourage rapid iteration
of algorithms and fast adoption among enthusiasts.

<h4>Bootstrapping a project</h4>

Bootstrapping an open source project means, promises about
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
affecting contributors to the project, business and end-users,
then Affero GPL would be a better choice.

But when one of them decide to host the binary on internet
providing commercial services, may be GPL is good enough.

And if either one of them decide to take the proprietary route,
for one reason or the other, a permissible license works better.

<h4> Business depending on open source </h4>

There are more number of business depending on open source
products than the number of business creating and selling open
source products.

For business depending on open source product it would be,
at best, annoying and, at worst, catastrophic when they find
them going proprietary.

For a business whose core competency is not with software, they
tend to choose software with protective license and as per need
they fork and contribute back to upstream.

<h4> Competition between business </h4>

On the other hand, when a business has software at its core competency,
when they use open source products to build a larger product and/or
derive from open source product to better satisfy its market and
customers-needs, a protective license is less suitable.

A protective license will force a business to publish their work back under
the same license. In many cases this amounts to giving free lunch
to its competitors.

In such cases almost always a permissible license is preferred.

<h4>Paying for open source</h4>

Average lifespan of tech companies does not exceed the average
lifespan of programmers. Many times programmers write code for companies
only to see them acquired, abandoned or go bankrupt. With proprietary
licensing, programmers have no choice but to move on and re-invent the
wheel.

It is better economics when companies release their code under a
permissible license. Over a period, there will be enough source base
under permissible license, like MIT, that companies don't have to
bear the cost of developing code from scratch. It is much cheaper
to fork existing code and adapt them to their needs.

**Useful links**

* [Opensource guide](https://opensource.guide/) from github.
* [Open source in embedded devices][tivoization] aka Tivoization.
* [Open letter to Intel][tanenbaum] by Andrew S. Tanenbaum and hacker-news
  [discussion][hn-tanenbaum] on the same.

<br>

<div style="text-align: center; color: cornflowerblue; font-weight: bold;">
End-user never bother about license or copyright.<br/>
And almost always care about quality and value-for-money.
</div>

[link1]: https://janelia-flyem.github.io/licenses.html
[link2]: https://dwheeler.com/essays/floss-license-slide.html
[table1]: https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses#General_comparison
[github]: https://github.com
[forking]: https://en.wikipedia.org/wiki/Fork_(software_development)
[patent-grant]: https://opensource.com/article/18/3/patent-grant-mit-license
[tivoization]: https://en.wikipedia.org/wiki/Tivoization
[tanenbaum]: https://www.cs.vu.nl/~ast/intel/
[hn-tanenbaum]: https://news.ycombinator.com/item?id=15642116
