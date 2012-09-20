require 'shuffler_fm/version'
require 'shuffler_fm/configuration'
require 'shuffler_fm/api'

#
# shuffler_fm is a thin ruby API wrapper for http://shuffler.fm REST API
#
module ShufflerFM
  class << self
    # Provides an API for a given API key
    #
    # @overload api(key)
    #   @param [String] key An api key provided by http://shuffler.fm
    #
    #   @return [ShufflerFM::API]
    #
    #   @example get an API instance
    #     api = ShufflerFM.api("your-api-key")
    #     api.tracks # gets 1st page of the track list
    #
    # @overload api(key, configuration)
    #   @param [String] key An api key provided by http://shuffler.fm
    #   @param [Hash] configuration The configuration descriptor
    #
    #   @option configuration [Integer] :connection_timeout The connection timeout in seconds. Defaults to 2.
    #   @option configuration [Integer] :read_timeout The open/read timeout in seconds. Defaults to 5.
    #   @option configuration [String]  :proxy The proxy. Is unset by default. (e.g. 'http://192.168.1.1:8080')
    #
    #   @return [ShufflerFM::API]
    #
    #   @example
    #     api = ShufflerFM.api("your-api-key", connection_timeout: 2, read_timeout: 3, proxy: 'http://192.168.1.1:8080')
    #     api.tracks # gets 1st page of the track list
    #
    # @see ShufflerFM.configure
    # @see ShufflerFM::Configuration
    #
    def api(key, configuration = {})
      self.configuration = Configuration.new(configuration)
      ShufflerFM::API.new(key)
    end

    # @!attribute [rw] configuration
    #   Access to the configuration descriptor
    attr_accessor :configuration

    # API wide configrations
    #
    # @yield [config] the configuration descriptor
    #
    # @see ShufflerFM.api
    # @see ShufflerFM::Configuration
    #
    # @example
    #   ShufflerFM.configure do |config|
    #     config.connection_timeout = 1 #seconds
    #     config.read_timeout       = 5 #seconds
    #     config.proxy              = { uri: 'http://192.168.1.1:8080', user: 'user1', password: 'passwd'}
    #   end
    #
    def configure
      yield(self.configuration)
    end
  end

  self.configuration = Configuration.new
end
