# Rack::Redirects

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

```ruby
use Rack::Redirects::Middleware do |old_url|
  if redirect = Redirects.find_by_old_url(old_url)
    redirect.new_url
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rack-redirects/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
