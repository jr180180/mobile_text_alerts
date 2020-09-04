require 'spec_helper'

RSpec.describe MobileTextAlerts::Client do
  let(:api_key) { 'bar' }
  let(:client) { MobileTextAlerts::Client.new(api_key) }

  describe 'default attributes' do

    it 'must include httparty methods' do
      expect(MobileTextAlerts::Client).to include(HTTParty)
    end

    it 'must have the base url set to Mobile Text Alerts API endpoint with your api key' do
      expect(client.base_uri).to eq("https://mobile-text-alerts.com/rest/?key=#{api_key}&request=")
    end

    it 'must have a default timeout set to 15 seconds' do
      MobileTextAlerts.configure do |config|
        config.api_key = api_key
      end
      client = MobileTextAlerts.new
      expect(client.api_key).to eq(api_key)
    end

  end

  describe "constructor" do

    it "requires api_key for a new instance" do
      expect { MobileTextAlerts::Client.new }.to raise_error(ArgumentError)
    end

  end

end
