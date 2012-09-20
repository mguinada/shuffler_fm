require 'shuffler_fm/http'
require 'shuffler_fm/request'
require 'shuffler_fm/errors'

require 'shuffler_fm/api/tracks'
require 'shuffler_fm/api/channels'

module ShufflerFM
  class API
    BASE_URI = 'http://api.shuffler.fm/'
    VERSION  = 'v1'

    include ShufflerFM::HTTP
    include ShufflerFM::Request

    include ShufflerFM::API::Tracks
    include ShufflerFM::API::Channels

    class << self
      # @!attribute [r] base_uri
      #   The REST API endpoint
      #
      def base_uri
        BASE_URI
      end

      # @!attribute [r] version
      #   The API version
      #
      def version
        VERSION
      end
    end

    # @!attribute [rw] key
    #   The API key
    #
    attr_reader :key

    # Creates an API instance
    #
    # @param [String] key An api key provided by http://shuffler.fm
    #
    # @example get an API instance
    #   api = ShufflerFM::API.new("your-api-key")
    #   api.tracks # gets 1st page of the track list
    #
    def initialize(key)
      raise ArgumentError, 'An API key must be provided' if key.nil?
      @key = key
    end
  end
end