module ShufflerFM
  class API
    # Shuffler.fm API operations over tracks
    module Tracks
      # Requests a list of tracks
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] a list of tracks
      #
      # @example
      #   tracks = api.tracks #first page
      #   #...
      #   tracks = api.tracks(page: 2)
      #
      def tracks(options = {})
        get("/tracks", options)
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

      # Streaming URI for a track.
      #
      # NOTE: This operation requires a specific authorization form shuffler.fm
      #
      # @param [Integer] id The track id
      #
      # @return [String] the track streaming URI if avaliable
      #
      def stream(id)
        get("/tracks/#{Integer(id)}/stream", {}, false).headers['location']
      end
    end
  end
end