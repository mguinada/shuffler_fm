module ShufflerFM
  # @private
  module Request
    def get(path, options = {})
      request(:get, path, options)
    end

    private
    # Performs an HTTP request
    #
    # == Parameters:
    # @param [Symbol] method The request method
    # @param [String] path The request path
    # @param [Hash] options The operation options
    #
    # @return The HTTP response
    #
    def request(method, path, options = {})
      response = http_connection.send(method) do |request|
        request.url("#{API.version}/#{path}", options)
      end

      response.body
    end
  end
end