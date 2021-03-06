require 'shuffler_fm/http'
require 'shuffler_fm/request'
require 'shuffler_fm/errors'

require 'shuffler_fm/api/blogs'
require 'shuffler_fm/api/tracks'
require 'shuffler_fm/api/artists'
require 'shuffler_fm/api/channels'
require 'shuffler_fm/api/charts'
require 'shuffler_fm/api/genres'

module ShufflerFM
  class API
    @base_uri = 'http://api.shuffler.fm/'
    @version  = 'v1'

    include ShufflerFM::HTTP
    include ShufflerFM::Request

    include ShufflerFM::API::Blogs
    include ShufflerFM::API::Tracks
    include ShufflerFM::API::Artists
    include ShufflerFM::API::Channels
    include ShufflerFM::API::Charts
    include ShufflerFM::API::Genres

    class << self
      attr_reader :base_uri, :version
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