module ShufflerFM
  class API
    # Shuffler.fm API operations over charts
    module Charts
      # Lists popular tracks charts
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] a list of tracks merged with chart metadata
      #
      def popular_charts(options = {})
        get("/charts/popular", options)
      end

      # Lists tracks that were recently added to the popular list
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] a list of tracks merged with chart metadata
      #
      def popular_charts_newest(options = {})
        get("/charts/new", options)
      end
    end
  end
end