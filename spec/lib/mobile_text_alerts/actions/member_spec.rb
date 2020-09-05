require 'spec_helper'

RSpec.describe MobileTextAlerts::Actions::Mms do
  let(:client) { MobileTextAlerts::Client.new('foo') }
  let(:client_url) { client.base_uri }
  let(:phone_number) { '1112223333' }
  let(:email) { 'foo@bar.com' }

  describe '#add_member' do
    let(:params) do
      {
        phone_number: phone_number,
        email:        email,
        first_name:   'Foo',
        last_name:    'Bar',
        groups:       ['11111']
      }
    end
    let(:add_member) { -> { client.add_member(params) } }

    context 'raises a MobileTextAlert::Error' do

      context 'if missing email and phone_number' do
        let(:params) do
          {
            first_name:   'Foo',
            last_name:    'Bar',
            groups:       ['11111']
          }
        end

        it 'call fails' do
          expect { add_member.call }.to raise_error(MobileTextAlerts::Error, 'Phone number or email required.')
        end
      end

      it 'on error response' do
        stub_request(:get, mta_client_url('add_member')).to_return(json_response('add_member_error'))
        expect { add_member.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
      end

    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('add_member')).to_return(json_response('add_member_success'))
      response = add_member.call
      expect(response['success']).to eq('Member Added')
    end

  end

  describe '#delete_member_via_number' do
    let(:delete_member_via_number) { -> { client.delete_member_via_number(phone_number) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('delete_member')).to_return(json_response('delete_member_error'))
      expect { delete_member_via_number.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('delete_member')).to_return(json_response('delete_member_success'))
      response = delete_member_via_number.call
      expect(response['success']).to eq('Member Deleted')
    end
  end

  describe '#delete_member_via_email' do
    let(:delete_member_via_email) { -> { client.delete_member_via_email(email) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('delete_member')).to_return(json_response('delete_member_error'))
      expect { delete_member_via_email.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('delete_member')).to_return(json_response('delete_member_success'))
      response = delete_member_via_email.call
      expect(response['success']).to eq('Member Deleted')
    end
  end

end
