require 'httparty'
require 'json'

require 'mobile_text_alerts/version'
require 'mobile_text_alerts/client'
require 'mobile_text_alerts/utils'
require 'mobile_text_alerts/actions/sms'

module MobileTextAlerts
  class Client
    include HTTParty
    include MobileTextAlerts::Utils
    include MobileTextAlerts::Actions::Sms

    attr_reader :api_key, :base_uri

    def initialize(api_key)
      @api_key  = api_key
      @base_uri = "https://mobile-text-alerts.com/rest/?key=#{api_key}&request="
    end
  end
end
