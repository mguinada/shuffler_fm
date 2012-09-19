require 'faraday'
require 'faraday_middleware'
require 'faraday/response/error_handler'

module ShufflerFM
  # @private
  module HTTP
    def connection
      options = {url: ShufflerFM::API.base_uri,
                 params: {'api-key' => key}}.merge(ShufflerFM.configuration.values)

      Faraday.new(options) do |builder|
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson

        builder.use Faraday::Response::ErrorHandler

        builder.adapter Faraday.default_adapter
      end
    end

    alias :http_connection :connection
  end
end