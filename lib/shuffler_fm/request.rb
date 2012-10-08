module ShufflerFM
  # @private
  module Request
    # Performs an HTTP GET request
    #
    # == Parameters:
    # @param [String] path The request path
    # @param [Hash] options The operation options
    #
    # @param [Boolean] managed true for a custom middleware mangaed connection,
    #                    false to overide the middleware and recive the raw http response
    #
    # @return The HTTP response
    #
    def get(path, options = {}, managed = true)
      request(:get, path, options, managed)
    end

    private
    def request(method, path, options = {}, managed = true)
      response = http_connection(managed).send(method) do |request|
        request.url("#{API.version}/#{path}", process_options(options))
      end

      return response.body if managed
      response
    end

    def process_options(options)
      #shuffler.fm REST API v1 determins the the first page on a paginated resource is 0.
      #We are abstracting that to start on page 1.
      options.merge(:page => Integer(options.delete(:page) { 1 }) - 1)
    end
  end
end