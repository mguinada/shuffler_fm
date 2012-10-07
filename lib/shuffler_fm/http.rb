require 'faraday'
require 'faraday_middleware'
require 'shuffler_fm/middleware/error_handler'

module ShufflerFM
  # @private
  module HTTP
    private
    def connection(managed = true)
      options = {:url => ShufflerFM::API.base_uri,
                 :params => {'api-key' => key}}.merge(ShufflerFM.configuration.values)

      Faraday.new(options) do |builder|
        if managed
          builder.use FaradayMiddleware::Rashify
          builder.use FaradayMiddleware::ParseJson
        end

        builder.use ShufflerFM::Middleware::ErrorHandler

        builder.adapter Faraday.default_adapter
      end
    end

    alias :http_connection :connection
  end
end