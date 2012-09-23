module ShufflerFM
  class API
    # Operations on shuffler.fm channels
    module Channels
      # Reads the media channels activity stream
      #
      # @param [String] key The channel key.
      #    Can be on of the following: mp3, youtube, vimeo, soundcloud or officialfm
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
      #
      # @return [Array] an array with the channel's activity stream
      #
      # @example
      #   api.media_channels('youtube', page: 2)
      #
      def media_channels(key, options = {})
        channel(:media, key, options)
      end

      # Reads the blog channels activity stream
      #
      # @param [String] key The channel key.
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
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
      # @param key The channel key.
      # @param [Hash] options
      # @option options [Integer] :page The page to request on paginated operation responses
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
      # @param [Array] keys The channel keys.
      #
      # @return [Array] an array with the channel's activity stream
      #
      # @example
      #    api.genre_channels('rock')
      #    api.genre_channels('punk', 'rock', page: 2)
      #
      def genre_channels(*keys)
        channel(:genre, *keys)
      end

      private
      def channel(*args)
        key, query, opts = process_args(args)

        uri = ""
        if key == :genre
          uri = "channels/#{String(query.join('+'))}"
        else
          uri = "channels/#{key}:#{String(query.join('+'))}"
        end

        get(uri, page: Integer(opts.fetch(:page) { 1 }))
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