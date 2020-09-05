require 'spec_helper'

RSpec.describe MobileTextAlerts::Actions::Mms do
  let(:client) { MobileTextAlerts::Client.new('foo') }
  let(:client_url) { client.base_uri }

  describe '#send_mms_to_number' do
    let(:send_mms_to_number) { -> { client.send_mms_to_number('1112223333', 'foo bar', 'https://foo.bar/image.png') } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('send_mms_message')).to_return(json_response('error'))
      expect { send_mms_to_number.call }.to raise_error(MobileTextAlerts::Error, 'Error message is here')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('send_mms_message')).to_return(json_response('success'))
      response = send_mms_to_number.call
      expect(response['success']).to eq('Message Sent')
    end

  end

  describe '#send_mms_to_group' do
    let(:send_mms_to_group) { -> { client.send_mms_to_group('1', 'foo bar') } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('send_mms_message')).to_return(json_response('error'))
      expect { send_mms_to_group.call }.to raise_error(MobileTextAlerts::Error, 'Error message is here')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('send_mms_message')).to_return(json_response('success'))
      response = send_mms_to_group.call
      expect(response['success']).to eq('Message Sent')
    end

  end
end
