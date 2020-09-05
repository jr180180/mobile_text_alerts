module MobileTextAlerts
  module Actions
    module Group

      # Add a group to your account.
      # @param [String] name
      # @param [String] keyword
      def add_group(name, keyword)
        uri = base_uri + 'add_group'
        uri += "&name=#{name}"
        uri += "&keyword=#{keyword}"

        Utils.send_request!(uri)
      end

      # Remove a group from your account.
      # @param [String] id
      def remove_group_via_id(id)
        uri = base_uri + 'remove_group'
        uri += "&id=#{id}"

        Utils.send_request!(uri)
      end

      # Remove a group from your account.
      # @param [String] keyword
      def remove_group_via_keyword(keyword)
        uri = base_uri + 'remove_group'
        uri += "&keyword=#{keyword}"

        Utils.send_request!(uri)
      end

      # Retrieve all groups on your account.
      def list_groups
        uri = base_uri + 'list_groups'

        Utils.send_request!(uri)
      end

      # Retrieve all members for a specific group belonging to the account
      # @param [String] group_id
      def list_group_members(group_id)
        uri = base_uri + 'list_group_members'
        uri += "&group_id=#{group_id}"

        Utils.send_request!(uri)
      end

    end
  end
end
