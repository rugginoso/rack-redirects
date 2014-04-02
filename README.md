# Rack::Redirects
[![Build Status](https://travis-ci.org/rugginoso/rack-redirects.svg?branch=master)](https://travis-ci.org/rugginoso/rack-redirects)
[![Coverage Status](https://coveralls.io/repos/rugginoso/rack-redirects/badge.png)](https://coveralls.io/r/rugginoso/rack-redirects)
[![Code Climate](https://codeclimate.com/github/rugginoso/rack-redirects.png)](https://codeclimate.com/github/rugginoso/rack-redirects)

This small middleware intercepts 404 responses and calls its
configuration block with the current url to decide what to do.

The configuration block can return:
- ```nil```, the actual response is forwarded
- empty string, it responds with a 410 - Gone response
- an url, it responds with 301 - Moved permanently response

## Installation

Add this line to your application's Gemfile:

    gem 'rack-redirects'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-redirects

## Usage

Rackup example:

```ruby
require 'rack/lobster'
require 'rack/redirects'

use Rack::CommonLogger
use Rack::ShowExceptions
use Rack::Redirects::Middleware do |env|
  case env['PATH_INFO']
  when '/' then '/lobster/'
  when '/gone/' then ''
  end
end
map "/lobster" do
  use Rack::Lint
  run Rack::Lobster.new
end
```

## Contributing

1. Fork it ( http://github.com/rugginoso/rack-redirects/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
