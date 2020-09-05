module MobileTextAlerts
  module Actions
    module Member

      # Add a subscriber to your text alert system
      # @param [Hash] args
      # {
      #   phone_number: '1112223333',
      #   email:        'foo@bar.com',
      #   first_name:   'Foo',
      #   last_name:    'Bar',
      #   groups:       ['11111']
      # }
      def add_member(**args)
        raise(MobileTextAlerts::Error, 'Phone number or email required.') if args[:phone_number].nil? && args[:email].nil?

        phone_number = Utils.parse_number(args[:phone_number]) if args[:phone_number]

        uri = base_uri + 'add_member'
        uri += "&number=#{phone_number}" if phone_number
        uri += "&email=#{args[:email]}" if args[:email]
        uri += "&first_name=#{args[:first_name]}" if args[:first_name]
        uri += "&last_name=#{args[:last_name]}" if args[:last_name]
        uri += "&groups=#{args[:groups].to_json}" if args[:groups]

        Utils.send_request!(uri)
      end

      # Remove a subscriber via phone number from your account
      # @param [String] phone_number
      # @return [Hash]
      def delete_member_via_number(phone_number)
        phone_number = Utils.parse_number(phone_number)
        uri = base_uri + 'delete_member'
        uri += "&number=#{phone_number}"

        Utils.send_request!(uri)
      end

      # Remove a subscriber via email from your account
      # @param [String] email
      # @return [Hash]
      def delete_member_via_email(email)
        uri = base_uri + 'delete_member'
        uri += "&email=#{email}"

        Utils.send_request!(uri)
      end

      # Add a member to a group.
      # @param [String] phone_number
      # @param [Hash] args - requires either the group_id or group_name key/value. You do not need to pass both.
      # {
      #   group_id: '111',
      #   group_name: 'Group'
      # }
      def add_member_to_group(phone_number, **args)
        raise(MobileTextAlerts::Error, 'Group name or id is required') if args[:group_name].nil? && args[:group_id].nil?

        phone_number = Utils.parse_number(phone_number)

        uri = base_uri + 'add_to_group'
        uri += "&number=#{phone_number}"
        uri += "&group_id=#{args[:group_id]}" if args[:group_id]
        uri += "&group_name=#{args[:group_name]}" if args[:group_name]

        Utils.send_request!(uri)
      end

      # Remove a subscriber from a group
      # @param [String] group_id
      # @param [String] phone_number
      def remove_from_group_via_number(group_id, phone_number)
        phone_number = Utils.parse_number(phone_number)

        uri = base_uri + 'remove_from_group'
        uri += "&group_id=#{group_id}"
        uri += "&number=#{phone_number}"

        Utils.send_request!(uri)
      end

      # Remove a subscriber from a group
      # @param [String] group_id
      # @param [String] email - may pass 'all' to remove all members from the group
      def remove_from_group_via_email(group_id, email)
        uri = base_uri + 'remove_from_group'
        uri += "&group_id=#{group_id}"
        uri += "&number=#{email}"

        Utils.send_request!(uri)
      end

      # Retrieve all members for a specific account
      # @return [Hash]
      def list_members
        uri = base_uri + 'list_members'

        Utils.send_request!(uri)
      end

      # Retrieve member for a specific account
      # @param [String] phone_number
      def get_member(phone_number)
        phone_number = Utils.parse_number(phone_number)

        uri = base_uri + 'get_member'
        uri += "&number=#{phone_number}"

        Utils.send_request!(uri)
      end

    end
  end
end
