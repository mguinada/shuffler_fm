describe ShufflerFM::API::Artists do
  use_vcr_cassette :artists

  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'lists artists' do
    api.artists.size.should be(50)
    api.artists(page: 3).size.should be(50)
  end

  it 'requests a specific artist' do
    api.artist(1).should be_a(Hashie::Mash)
    api.artist(0).should be_nil
  end

  it 'requests an artist top blogs' do
    api.artist_blogs(1).should be_a(Array)
    api.artist_blogs(1, page: 3).should be_a(Array)
  end

  it 'searches for an artist' do
    api.search_artist('queen').should be_a(Array)
    api.search_artist('queen', page: 3).should be_a(Array)
  end
end