module ShufflerFM
  class API
    # Shuffler.fm API operations over blogs
    module Blogs
      # Requests a list of blogs
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of blogs
      #
      def blogs(options = {})
        get("/blogs", :page => page(options))
      end

      # Requests a list of featured blogs
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] a list of featured blogs
      #
      def featured_blogs(options = {})
        get("/blogs", :page => page(options), :filter => 'featured')
      end

      # Requests a particular blog
      #
      # @param [Integer] id The blog id
      #
      # @return [Blog] the requested blog or nil if not found
      #
      def blog(id)
        get("/blogs/#{Integer(id)}")
      rescue ShufflerFM::NotFound
        nil
      end

      # Search blogs
      #
      # @param [String] q your query
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] an array of results
      #
      def search_blogs(q, options = {})
        get("/blogs?q=#{String(q)}", :page => page(options))
      end
    end
  end
end