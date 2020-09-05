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

  describe '#add_member_to_group' do
    let(:add_member_to_group) { -> { client.add_member_to_group(phone_number, { group_name: 'Group' }) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('add_to_group')).to_return(json_response('field_not_set_error'))
      expect { add_member_to_group.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('add_to_group')).to_return(json_response('add_member_to_group_success'))
      response = add_member_to_group.call
      expect(response['success']).to eq(true)
    end
  end

  describe '#remove_from_group_via_number' do
    let(:remove_from_group_via_number) { -> { client.remove_from_group_via_number('1111', phone_number) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('remove_from_group')).to_return(json_response('field_not_set_error'))
      expect { remove_from_group_via_number.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('remove_from_group')).to_return(json_response('add_member_to_group_success'))
      response = remove_from_group_via_number.call
      expect(response['success']).to eq(true)
    end
  end

  describe '#remove_from_group_via_email' do
    let(:remove_from_group_via_email) { -> { client.remove_from_group_via_email('1111', email) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('remove_from_group')).to_return(json_response('field_not_set_error'))
      expect { remove_from_group_via_email.call }.to raise_error(MobileTextAlerts::Error, 'Required field not set.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('remove_from_group')).to_return(json_response('add_member_to_group_success'))
      response = remove_from_group_via_email.call
      expect(response['success']).to eq(true)
    end
  end

  describe '#list_members' do
    let(:list_members) { -> { client.list_members } }

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('list_members')).to_return(json_response('list_members_success'))
      response = list_members.call
      expect(response['members'][0]['firstName']).to eq('Foo')
      expect(response['members'][0]['lastName']).to eq('Bar')
      expect(response['members'][0]['number']).to eq(phone_number)
      expect(response['members'][0]['email']).to eq(email)
    end
  end

  describe '#get_member' do
    let(:get_member) { -> { client.get_member(phone_number) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('get_member')).to_return(json_response('get_member_error'))
      expect { get_member.call }.to raise_error(MobileTextAlerts::Error, 'Could not find number on your account')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('get_member')).to_return(json_response('get_member_success'))
      response = get_member.call
      expect(response['info']['firstName']).to eq('Foo')
    end
  end

end
