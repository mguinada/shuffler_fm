describe ShufflerFM::API::Channels do
  use_vcr_cassette :channels

  describe 'stream activity on' do
    let!(:api) { ShufflerFM::API.new(KEY) }

    it 'media' do
      api.media_channels('mp3').should be_a(Array)
    end

    it 'blogs' do
      api.blog_channels(1).should be_a(Array)
    end

    it 'artists' do
      api.artist_channels('Pixies', page: 2).should be_a(Array)
    end

    it 'genre' do
      api.genre_channels('punk', 'rock', page: 2).should be_a(Array)
    end
  end
end