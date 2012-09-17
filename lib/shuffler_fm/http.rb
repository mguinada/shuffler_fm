require 'faraday'
require 'faraday_middleware'
require 'faraday/response/error_handler'

#TODO: set timeouts
#TODO: set proxy
module ShufflerFM
  # @private
  module HTTP
    def connection
      Faraday.new({url: ShufflerFM::API.base_uri, params: {'api-key' => key}}) do |builder|
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson

        builder.use Faraday::Response::ErrorHandler

        builder.adapter Faraday.default_adapter
      end
    end

    alias :http_connection :connection
  end
end