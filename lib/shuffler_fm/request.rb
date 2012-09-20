module ShufflerFM
  # @private
  module Request
    # Performs an HTTP GET request
    #
    # == Parameters:
    # @param [String] path The request path
    # @param [Hash] options The operation options
    #
    # @return The HTTP response
    #
    def get(path, options = {})
      request(:get, path, options)
    end

    private
    def request(method, path, options = {}, &block)
      response = http_connection.send(method) do |request|
        request.url("#{API.version}/#{path}", options)
      end

      response.body
    end
  end
end