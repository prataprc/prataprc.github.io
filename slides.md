---
layout: page
title: Slides
permalink: /slides/
---

## [Golang: Data formats for storage][slide1]


* High performance algorithms for data transformation, serialization
  and manipulation.
* Based on well established standards.
* ZERO allocation when transforming from one format to another, except
  for APIs creating golang values from encoded data.
* JSON for web.
* CBOR for machine.
* Binary-Collation for crazy fast comparison/sorting.

## [Golang: logging with batteries included][slide2]

* APIs to prefix log-level in log messages.
* Global option to redirect logs to a file.
* Include/Exclude/Format log time.
* Colorize log messages for different levels.
* Console logging.
* Stable APIs, existing APIs are not going to change.

## [Golang: Settings for libraries and apps][slide3]

* Easy to learn and easy to use settings for golang libraries and applications.
* Settings object is represented as map[string]interface{} object.
* Settings can be marshalled to JSON or un-marshalled from JSON.
* Possible to add more formats for marshalling and un-marshalling settings.
* All methods exported on settings object are immutable, except Mixin.
* Stable APIs, existing APIs are not going to change

[slide1]: https://gitpitch.com/prataprc/gson/master?grs=github
[slide2]: https://gitpitch.com/prataprc/golog/master?grs=github
[slide3]: https://gitpitch.com/prataprc/gosettings/master?grs=github
