module MobileTextAlerts
  module Actions
    module Mms

      # Allows you to send a MMS message to a recipient's phone number
      # @param [String] phone_number
      # @param [String] message
      # @param [String] attachment_url to jpg, jpeg, png, gif file (optional)
      # @return [Hash] response body
      def send_mms_to_number(phone_number, message, attachment_url)
        phone_number = Utils.parse_number(phone_number)
        uri = base_uri + 'send_mms_message'
        uri += "&number=#{phone_number}"
        uri += "&message=#{message}"
        uri += "&attachment=#{attachment_url}" if attachment_url
        Utils.send_request!(uri)
      end

      # Allows you to send MMS messages to a group of recipients or all subscribers.
      # Pass in 'all' as the the `group_id` to send to all of your subscribers.
      # @param [String] group_id
      # @param [String] message
      # @param [String] attachment_url to jpg, jpeg, png, gif file (optional)
      # @return [Hash]
      def send_mms_to_group(group_id, message, attachment_url = nil)
        uri = base_uri + 'send_mms_message'
        uri += "&group_id=#{group_id}"
        uri += "&message=#{message}"
        uri += "&attachment=#{attachment_url}" if attachment_url
        Utils.send_request!(uri)
      end

    end
  end
end
