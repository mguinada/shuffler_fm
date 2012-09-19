require 'hashie'

module ShufflerFM
  # Configuration descriptor
  #
  class Configuration < Hashie::Dash
    # @!attribute [rw] connection_timeout
    #   The connection timeout in seconds. Defaults to 2.
    property :connection_timeout, required: true, default: 2
    # @!attribute [rw] read_timeout
    #   The open/read timeout in seconds. Defaults to 5.
    property :read_timeout, required: true, default: 5
    # @!attribute [rw] proxy
    #   The proxy. Is unset by default.
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