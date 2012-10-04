module ShufflerFM
  class API
    module Genres
      # Requests a list of genres
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      #
      # @return [Array] a list of genres
      #
      def genres(options = {})
        get("/genres", options)
      end

      # Requests a particular genre
      #
      # @param [Integer] id The genre id
      #
      # @return [Genre] the requested genre or nil if not found
      #
      def genre(id, options = {})
        get("/genres/#{Integer(id)}", options)
      rescue ShufflerFM::NotFound
        nil
      end
    end
  end
end