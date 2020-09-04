require 'mobile_text_alerts/version'
require 'mobile_text_alerts/client'

module MobileTextAlerts
  class Error < StandardError; end

  class << self
    attr_accessor :configuration

    def new
      @configuration ||= Configuration.new
      MobileTextAlerts::Client.new(@configuration.api_key)
    end

    def configure
      @configuration ||= Configuration.new
      yield(@configuration)
    end
  end

  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = 'foo'
    end
  end
end
