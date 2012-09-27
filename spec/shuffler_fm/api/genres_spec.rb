describe ShufflerFM::API::Genres do
  use_vcr_cassette :genres

  let!(:api) { ShufflerFM.api(KEY) }

  it 'lists genres' do
    api.genres.should be_a(Array)
    api.genres(:page => 2).should be_a(Array)
  end

  it 'requests a specific genre' do
    api.genre(1).should be_a(Hashie::Mash)
    api.genre(0).should be_nil
  end
end