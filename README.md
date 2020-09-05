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

The following examples assume that you've instantiated your MTA client.

```ruby
client = MobileTextAlerts.new
```

### SMS Messages

#### Sending SMS messages to a phone number

Pass in the phone number and the message.

```ruby
client.send_sms_to_number('1112223333', 'foo bar')
```

#### Sending SMS messages to a MTA group

Pass in the group id from MTA and the message.

If you would like to send the message to all of your subscribers, use `'all'` as the group_id parameter.

```ruby
client.send_sms_to_group('1', 'foo bar')
```

### MMS Messages

#### Sending MMS messages to a phone number

Pass in the phone number, the message, and the url to the image file.

```ruby
client.send_mms_to_number('1112223333', 'foo bar', 'https://foo.bar/image.png')
```

#### Sending MMS messages to a MTA group

Pass in the group id from MTA, the message, and the image url.

If you would like to send the message to all of your subscribers, use `'all'` as the group_id parameter.

```ruby
client.send_mms_to_group('1112223333', 'foo bar', 'https://foo.bar/image.png')
```

### TTS Messages

#### Sending TTS messages to a phone number

Pass in the phone number, the message, and the url to the image file.

```ruby
client.send_tts_to_number('1112223333', 'foo bar')
```

#### Sending TTS messages to a MTA group

Pass in the group id from MTA, the message, and the image url.

If you would like to send the message to all of your subscribers, use `'all'` as the group_id parameter.

```ruby
client.send_tts_to_group('1112223333', 'foo bar')
```

### Adding contacts/members to your account

Pass in a hash of the contacts information. You must provide at the very least, the phone number or email address of the contact.

```ruby
contact_info = {
    phone_number: phone_number,
    email:        email,
    first_name:   'Foo',
    last_name:    'Bar',
    groups:       ['11111']
}
client.add_member(contact_info)
```

### Delete contacts/members from your account

You must pass either the phone number or email address of the contact in your account.

```ruby
client.delete_member_via_number(phone_number)
# OR
client.delete_member_via_email(email)
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jr180180/mobile_text_alerts. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jr180180/mobile_text_alerts/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MobileTextAlerts project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jr180180/mobile_text_alerts/blob/master/CODE_OF_CONDUCT.md).
