module ShufflerFM
  class API
    # Shuffler.fm API operations over charts
    module Charts
      # Lists popular tracks charts
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of tracks merged with chart metadata
      #
      def popular_charts(options = {})
        get("/charts/popular", :page => page(options))
      end

      # Lists tracks that were recently added to the popular list
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of tracks merged with chart metadata
      #
      def popular_charts_newest(options = {})
        get("/charts/new", :page => page(options))
      end
    end
  end
end