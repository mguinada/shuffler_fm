module ShufflerFM
  class API
    # Shuffler.fm API operations over tracks
    module Tracks
      # Requests a list of tracks
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of tracks
      #
      # @example
      #   tracks = api.tracks #first page
      #   #...
      #   tracks = api.tracks(page: 2)
      #
      def tracks(options = {})
        get("/tracks", page: page(options))
      end

      # Requests a particular track
      #
      # @param [Integer] id The track id
      # @return [Track] the requested track or nil if not found
      #
      def track(id)
        get("/tracks/#{Integer(id)}")
      rescue ShufflerFM::NotFound
        nil
      end
    end
  end
end