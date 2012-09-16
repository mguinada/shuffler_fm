require 'shuffler_fm/http'
require 'shuffler_fm/request'
require 'shuffler_fm/errors'

module ShufflerFM
  class API
    BASE_URI = 'http://api.shuffler.fm/'
    VERSION  = 'v1'

    include ShufflerFM::HTTP
    include ShufflerFM::Request

    class << self
      # The REST API endpoint
      #
      def base_uri
        BASE_URI
      end

      # The API version
      #
      def version
        VERSION
      end
    end

    attr_reader :key

    # Creates an API instance
    #
    # @param [String] key An api key provided by http://shuffler.fm
    #
    def initialize(key)
      raise ArgumentError, 'An API key must be provided' if key.nil?
      @key = key
    end

    # Requests a list of all tracks
    #
    # @param [Hash] opts options:
    #
    # :page - The page to request on paginated operation responses
    #
    # @return [Array] a list of tracks
    #
    def tracks(opts = {})
      get("/tracks", page: Integer(opts.fetch(:page) { 1 }))
    end
  end
end