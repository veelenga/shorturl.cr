# shorturl.cr [![Build Status](https://travis-ci.org/veelenga/shorturl.cr.svg?branch=master)](https://travis-ci.org/veelenga/shorturl.cr)

A simple library to use URL shortening services. Inspired by Robby Russell's [shorturl](https://github.com/robbyrussell/shorturl).

## Usage

As easy as it could be:

```crystal
require "shorturl"

ShortURL.shorten "http://google.com"           # => http://tinyurl.com/2tx
ShortURL.shorten "http://google.com", :tinyurl # => http://tinyurl.com/2tx
ShortURL.shorten "http://google.com", :isgd    # => http://is.gd/OwycZW
```
## Available services

Here is a list of available shortening services:

* [tinyurl.com](http://tinyurl.com)
* [is.gd](http://is.gd)

## Contributing

1. Fork it
1. Create your feature branch
1. Run tests with `crystal spec`
1. Commit your changes
1. Push to the branch
1. Create a new Pull Request
