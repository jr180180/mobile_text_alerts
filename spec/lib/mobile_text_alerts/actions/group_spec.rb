require 'spec_helper'

RSpec.describe MobileTextAlerts::Actions::Mms do
  let(:client) { MobileTextAlerts::Client.new('foo') }
  let(:client_url) { client.base_uri }
  let(:phone_number) { '1112223333' }
  let(:email) { 'foo@bar.com' }
  let(:group_id) { '1111' }
  let(:group_name) { 'Group' }
  let(:group_keyword) { 'keyword' }

  describe '#add_group' do
    let(:add_group) { -> { client.add_group(group_name, group_keyword) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('add_group')).to_return(json_response('add_group_error'))
      expect { add_group.call }.to raise_error(MobileTextAlerts::Error, '‘Keyword’ is required to add a group.')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('add_group')).to_return(json_response('add_group_success'))
      response = add_group.call
      expect(response['success']).to include('The group')
    end
  end

  describe '#remove_group_via_id' do
    let(:remove_group_via_id) { -> { client.remove_group_via_id(group_name) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('remove_group')).to_return(json_response('remove_group_error'))
      expect { remove_group_via_id.call }.to raise_error(MobileTextAlerts::Error, 'The group could not be found')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('remove_group')).to_return(json_response('remove_group_success'))
      response = remove_group_via_id.call
      expect(response['success']).to eq('The group has been successfully removed.')
    end
  end

  describe '#remove_group_via_keyword' do
    let(:remove_group_via_keyword) { -> { client.remove_group_via_keyword(group_name) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('remove_group')).to_return(json_response('remove_group_error'))
      expect { remove_group_via_keyword.call }.to raise_error(MobileTextAlerts::Error, 'The group could not be found')
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('remove_group')).to_return(json_response('remove_group_success'))
      response = remove_group_via_keyword.call
      expect(response['success']).to eq('The group has been successfully removed.')
    end
  end

  describe '#list_groups' do
    let(:list_groups) { -> { client.list_groups } }

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('list_groups')).to_return(json_response('list_groups_success'))
      response = list_groups.call
      expect(response.first['id']).not_to eq(nil)
    end
  end

  describe '#list_group_members' do
    let(:list_group_members) { -> { client.list_group_members(group_id) } }

    it 'raises a MobileTextAlert::Error on error response' do
      stub_request(:get, mta_client_url('list_group_members')).to_return(json_response('list_group_members_error'))
      expect { list_group_members.call }.to raise_error(MobileTextAlerts::Error, "You are not allowed to view members of group '1111'")
    end

    it 'returns a hash on success response' do
      stub_request(:get, mta_client_url('list_group_members')).to_return(json_response('list_group_members_success'))
      response = list_group_members.call
      expect(response['members'][0]['firstName']).not_to eq(nil)
    end
  end

end
