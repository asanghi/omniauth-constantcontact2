# Omniauth::ConstantContact2

This gem is an OmniAuth 2.0 Strategy for the [ConstantContact API](http://http://community.constantcontact.com/t5/Documentation/Authentication-using-OAuth-2-0-new-October-2011/ba-p/38313)

It supports the OmniAuth REST API which uses OAuth 2.0

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-constantcontact2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-constantcontact2

## Usage

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :constantcontact, ENV['CC_KEY'], ENV['CC_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :constantcontact, ENV['CC_KEY'], ENV['CC_SECRET']
end
```

You will have to put in your consumer key and secret, which you can find at http://community.constantcontact.com/t5/Documentation/API-Keys/ba-p/25015

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Aditya Sanghi. See [LICENSE](https://github.com/asanghi/omniauth-constantcontact2/blob/master/LICENSE.md) for details.
