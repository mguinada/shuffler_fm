require 'shuffler_fm/http'
require 'shuffler_fm/request'
require 'shuffler_fm/errors'

require 'shuffler_fm/api/blogs'
require 'shuffler_fm/api/tracks'
require 'shuffler_fm/api/artists'
require 'shuffler_fm/api/channels'
require 'shuffler_fm/api/charts'

module ShufflerFM
  class API
    BASE_URI = 'http://api.shuffler.fm/'
    VERSION  = 'v1'

    include ShufflerFM::HTTP
    include ShufflerFM::Request

    include ShufflerFM::API::Blogs
    include ShufflerFM::API::Tracks
    include ShufflerFM::API::Artists
    include ShufflerFM::API::Channels
    include ShufflerFM::API::Charts

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

    private
    def page(options)
      Integer(options.fetch(:page) { 1 })
    end
  end
end