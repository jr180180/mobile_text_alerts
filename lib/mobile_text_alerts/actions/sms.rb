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

        response = HTTParty.get(uri)
        response = Utils.parse_response(response)
        Utils.raise_error_on(response)

        response
      end

    end
  end
end
