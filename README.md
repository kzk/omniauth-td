# OmniAuth Treasure Data Strategy

This gem provides a dead simple way to authenticate to Treasure Data using OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-td'
```

## Usage

```ruby
use OmniAuth::Builder do
  provider :td
end
```

## Auth Hash Schema

The following information is provided back to you for this provider:

```ruby
{
  uid: 12345,
  info: {
    account_id: 12345,
    email: 'kazuki.ohta@gmail.com'
  },
  credentials: {
    apikey: 'YOUR_TREASURE_DATA_APIKEY'
  },
  extra: {}
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
