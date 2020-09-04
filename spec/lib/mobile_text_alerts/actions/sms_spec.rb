require 'spec_helper'

RSpec.describe MobileTextAlerts::Actions::Sms do
  let(:client) { MobileTextAlerts::Client.new('foo') }
  let(:client_url) { client.base_uri }
  let(:send_sms_to_number) { -> { client.send_sms_to_number('1112223333', 'foo bar') } }

  describe '#send_sms_to_number' do

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url).to_return(json_response('error'))
      expect { send_sms_to_number.call }.to raise_error(MobileTextAlerts::Error, 'Error message is here')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url).to_return(json_response('success'))
      response = send_sms_to_number.call
      expect(response['success']).to eq('Message Sent')
    end

  end
end
