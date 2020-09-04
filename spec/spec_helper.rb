require "bundler/setup"
require "mobile_text_alerts"
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def mta_client_url
  /https:\/\/mobile-text-alerts.com\/rest\/\?key=foo.*/
end

def fixture(filename)
  File.dirname(__FILE__) + '/fixtures/' + filename
end

def json_response(key)
  { body: open(fixture(key + '.json')).read }
end
