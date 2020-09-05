module MobileTextAlerts
  module Utils

    class << self

      # Removes any non-digits from the phone_number string
      # @param [String] phone_number
      # @return [String]
      def parse_number(phone_number)
        phone_number.delete('^0-9')
      end

      # Raises an exception if the response is an error response
      # Otherwise, it returns the response hash
      # @param [Hash] response
      def raise_error_on(response)
        if response['error']
          raise Error.new(response['error'])
        elsif response['failed_numbers']
          message = response['failed_numbers']
          # may be an array?
          message = message.is_a?(String) ? message : message.join(', ')
          raise Error.new(message)
        else
          response
        end
      end

      def parse_response(http_response)
        response = http_response.parsed_response
        response.kind_of?(Hash) ? response : JSON.parse(response)
      end

      def send_request!(uri)
        response = HTTParty.get(uri)
        response = Utils.parse_response(response)
        Utils.raise_error_on(response)

        response
      end

    end

  end
end
