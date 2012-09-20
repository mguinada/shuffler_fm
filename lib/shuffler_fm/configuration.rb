require 'hashie'

module ShufflerFM
  # Configuration descriptor
  class Configuration < Hashie::Dash
    # @!attribute [rw] connection_timeout
    #   The connection timeout in seconds. Defaults to 2.
    #
    property :connection_timeout, required: true, default: 2
    # @!attribute [rw] read_timeout
    #   The open/read timeout in seconds. Defaults to 5.
    #
    property :read_timeout, required: true, default: 5
    # @!attribute [rw] proxy
    #   The proxy. Is unset by default.
    #
    # @example
    #   ShufflerFM.configure do |cfg|
    #    cfg.proxy = 'http://192.168.1.1:8080'
    #   end
    #
    #   #or with authentication
    #
    #   ShufflerFM.configure do |cfg|
    #    cfg.proxy = { uri: 'http://192.168.1.1:8080',
    #                  user: 'user1',
    #                  password: 'passwd' }
    #   end
    #
    property :proxy, default: nil

    def initialize(cfg = {})
      super(cfg)
    end

    # The current configuration as an hash
    #
    # @return [Hash]
    #
    def values
      to_hash(symbolize_keys: true)
    end
  end
end