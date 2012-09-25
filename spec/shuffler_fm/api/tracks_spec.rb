describe ShufflerFM::API::Tracks do
  use_vcr_cassette :tracks

  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'lists tracks' do
    api.tracks.size.should be(50)
    api.tracks(:page => 2).size.should be(50)
  end

  it 'requests a specific track' do
    api.track(1).should be_a(Hashie::Mash)
    api.track(0).should be_nil
  end
end