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
    def request(method, path, options = {})
      response = http_connection.send(method) do |request|
        request.url("#{API.version}/#{path}", process_options(options))
      end

      response.body
    end

    def process_options(options)
      #shuffler.fm REST API v1 determins the the first page on a paginated resource is 0.
      #We are abstracting that to start on page 1.
      options.merge(:page => Integer(options.delete(:page) { 1 }) - 1)
    end
  end
end