# MobileTextAlerts

A simple Ruby wrapper for working with the Mobile-Text-Alerts.com API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mobile_text_alerts'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mobile_text_alerts
    
### Setup your project

After installing the gem in your project, you need to add the following configuration to your project:

```ruby
# config/initializers/mobile_text_alerts.rb
MobileTextAlerts.configure do |config|
    config.api_key = YOUR_API_KEY
end
```

Of course, replace `YOUR_API_KEY` with your Mobile Text Alerts API key from your developer settings area in your account.

## Usage

### Sending SMS messages to a phone number

```ruby
client = MobileTextAlerts.new
client.send_sms_to_number('1112223333', 'foo bar')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mobile_text_alerts. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mobile_text_alerts/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MobileTextAlerts project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mobile_text_alerts/blob/master/CODE_OF_CONDUCT.md).
