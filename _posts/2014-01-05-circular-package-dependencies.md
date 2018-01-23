---
layout: post
title: "Circular package dependencies in python"
permalink: circular-package-dependencies.html
---

I am developing `pluggdapps`, `tayra` and `tayrakit`, and releasing them
periodically. `pluggdapps` is a component system using which Tayra templating
language is designed and built. `tayrakit` is a collection of template plugins,
under development, that uses Tayra as the templating language.

For couple of reasons, I also added a web framework based on Pluggdapps
component system and started releasing it as sub-package withing Pluggdapps.
The web framework comes with authentication and a configuration web-app that
can be used to configure web-apps written with Pluggdapps. These web
applications are in turn using `tayra` and `tayrakit`, creating a circular
dependency.

.. code-block:: text

            tayrakit -----> tayra -----> pluggdapps
               ^            ^             |
               |            |             |
               *------------*-------------*

It just took me couple of releases to realize how circular dependency is
cumbersome and painful during the release phase - it is difficult to make a
working release without making sure that dependant releases are equally good.
This means that I had to go through couple of iteration of releases to make
sure that all packages are stable and working.
