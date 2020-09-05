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
        uri += "&number=#{email}"

        Utils.send_request!(uri)
      end

    end
  end
end
