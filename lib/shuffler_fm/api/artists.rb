module ShufflerFM
  class API
    # Operations on shuffler.fm artists
    module Artists
      # Requests a list of all artists
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of artists
      #
      def artists(options = {})
        get("/artists", page: page(options))
      end

      # Requests a particular artist
      #
      # @param [Integer] id The artist id
      #
      # @return [Artist] the requested artist or nil if not found
      #
      def artist(id)
        get("/artists/#{Integer(id)}")
      rescue ShufflerFM::NotFound
        nil
      end

      # Requests an artist's top blogs
      #
      # @param [Integer] id the artist id
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] an array of results
      #
      def artist_blogs(id, options= {})
        get("artists/#{Integer(id)}/blogs", page: page(options))
      end

      # Search for an artist
      #
      # @param [String] q your query
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] an array of results
      #
      def search_artist(q, options = {})
        raise ArgumentError, "Needs to be provided with a query" if q.nil?
        get("/artists?q=#{String(q.split.join('+'))}", page: page(options))
      end
    end
  end
end