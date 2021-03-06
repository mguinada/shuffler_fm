module ShufflerFM
  class API
    # Shuffler.fm API operations over channels
    module Channels
      # Reads the media channels activity stream
      #
      # @param [String] key The channel key.
      #    Can be on of the following: mp3, youtube, vimeo, soundcloud or officialfm
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] an array with the channel's activity stream
      #
      # @example
      #   api.media_channels('soundcloud')
      #
      def media_channels(key, options = {})
        channel(:media, key, options)
      end

      # Reads the blog channels activity stream
      #
      # @param [Integer] key The blog id
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] an array with the channel's activity stream
      #
      # @example
      #    api.blog_channels(21)
      #
      def blog_channels(key, options = {})
        channel(:blog, key, options)
      end

      # Reads the artist channels activity stream
      #
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      # @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      # @return [Array] an array with the channel's activity stream
      #
      # @example
      #    api.artist_channels('Pixies', page: 1)
      #
      def artist_channels(key, options = {})
        channel(:artist, key, options)
      end

      # Reads the genere channels activity stream.
      #
      # @overload genre_channels(*keys)
      #   @param [Array] keys The channel keys.
      #
      #   @example
      #      api.genre_channels('punk')
      #      api.genre_channels('punk', 'rock')
      #
      # @overload genre_channels(*keys, options)
      #   @param [Hash] options
      #   @option options [Integer] :page The page to request on paginated operation responses. First page is page 1.
      #   @option options [Integer] :per_page The page size. Default is 50, maximum is 100.
      #
      #   @example
      #      api.genre_channels('punk', 'rock', page: 1, per_page: 10)
      #
      # @return [Array] an array with the channel's activity stream
      #
      def genre_channels(*keys)
        channel(:genre, *keys)
      end

      private
      def channel(*args)
        key, query, opts = process_args(args)
        get((key == :genre ? "channels/" : "channels/#{key}:") << "#{String(query.join('+'))}", opts)
      rescue ShufflerFM::NotFound
        []
      end

      def process_args(args)
        channels = %w(genre media blog artist)

        if !channels.include?(args.first.to_s)
          raise ArgumentError, "channel key must be one of: #{channels.join(', ')} but is #{args.first}"
        end

        if (query = Array(args[1..-1])).nil?
          raise ArgumentError, "query value(s) must be provided"
        end

        return args.first.to_sym, query, query.last.is_a?(Hash) ? query.pop : {}
      end
    end
  end
end