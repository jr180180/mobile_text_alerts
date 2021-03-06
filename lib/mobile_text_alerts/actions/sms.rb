module MobileTextAlerts
  module Actions
    module Sms

      # Allows you to send an SMS message to a recipient's phone number
      # @param [String] phone_number
      # @param [String] message
      # @return [Hash] response body
      def send_sms_to_number(phone_number, message)
        phone_number = Utils.parse_number(phone_number)
        uri = base_uri + 'send_message'
        uri += "&number=#{phone_number}"
        uri += "&message=#{message}"
        Utils.send_request!(uri)
      end

      # Allows you to send SMS messages to a group of recipients or all subscribers.
      # Pass in 'all' as the the `group_id` to send to all of your subscribers.
      # @param [String] group_id
      # @param [String] message
      # @return [Hash]
      def send_sms_to_group(group_id, message)
        uri = base_uri + 'send_message'
        uri += "&group_id=#{group_id}"
        uri += "&message=#{message}"
        Utils.send_request!(uri)
      end

    end
  end
end
