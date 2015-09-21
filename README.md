# shorturl.cr [![Build Status](https://travis-ci.org/veelenga/shorturl.cr.svg?branch=master)](https://travis-ci.org/veelenga/shorturl.cr)

A simple library to use URL shortening services. Inspired by Robby Russell's [shorturl](https://github.com/robbyrussell/shorturl).

## Installation

As a dependency in `shards.yml`:

```yaml
dependencies:
  shorturl:
    github: veelenga/shorturl.cr
    branch: master
```

## Usage

As easy as it could be:

```crystal
require "shorturl"

# shorten
ShortURL.shorten "http://google.com"           # => "http://tinyurl.com/2tx"
ShortURL.shorten "http://google.com", :tinyurl # => "http://tinyurl.com/2tx"
ShortURL.shorten "http://google.com", :isgd    # => "http://is.gd/OwycZW"

# expand
ShortURL.expand "http://tinyurl.com/2tx"       # => "http://google.com"
```
## Available services

Here is a list of available shortening services in shorturl.cr:

* [is.gd](http://is.gd)
* [shorl.com](http://shorl.com)
* [tinyurl.com](http://tinyurl.com)
* [v.gd](http://v.gd)

## Contributing

1. Fork it
1. Create your feature branch
1. Implement your feature
1. Run tests with `crystal spec`
1. Commit your changes
1. Push to the branch
1. Create a new Pull Request
