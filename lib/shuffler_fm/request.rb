module ShufflerFM
  module Request
    # Performs an HTTP GET
    #
    # @param [String] path The request path
    # @return The HTTP GET response
    #
    def get(path)
      request(:get, path)
    end

    private
    # Performs an HTTP request
    #
    # == Parameters:
    # @param [Symbol] method The request method
    # @param [String] path The request path
    # @return The HTTP response
    #
    def request(method, path)
      response = http_connection.send(method) do |request|
        request.url("#{API.version}/#{path}")
      end

      response.body
    end
  end
end