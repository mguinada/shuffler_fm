require 'shuffler_fm/version'
require 'shuffler_fm/api'

module ShufflerFM
  class << self
    # Provides an API for a given API key
    #
    # @param [String] key An api key provided by http://shuffler.fm
    # @return [ShufflerFM::API]
    #
    def api(key)
      ShufflerFM::API.new(key)
    end
  end
end
