require 'spec_helper'

RSpec.describe MobileTextAlerts::Actions::Tts do
  let(:client) { MobileTextAlerts::Client.new('foo') }
  let(:client_url) { client.base_uri }
  let(:phone_number) { '1112223333' }

  describe '#send_tts_to_number' do
    let(:send_tts_to_number) { -> { client.send_tts_to_number(phone_number, 'foo bar') } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('send_tts_message')).to_return(json_response('tts_error'))
      expect { send_tts_to_number.call }.to raise_error(MobileTextAlerts::Error, "[\"#{phone_number}\"]")
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('send_tts_message')).to_return(json_response('success'))
      response = send_tts_to_number.call
      expect(response['success']).to eq('Message Sent')
    end

  end

  describe '#send_tts_to_group' do
    let(:send_tts_to_group) { -> { client.send_tts_to_group('1', 'foo bar') } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('send_tts_message')).to_return(json_response('tts_error'))
      expect { send_tts_to_group.call }.to raise_error(MobileTextAlerts::Error, "[\"#{phone_number}\"]")
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('send_tts_message')).to_return(json_response('success'))
      response = send_tts_to_group.call
      expect(response['success']).to eq('Message Sent')
    end

  end
end
