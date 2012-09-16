describe ShufflerFM::API do
  use_vcr_cassette
  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'lists tracks' do
    api.tracks.size.should be(50)
    api.tracks(page: 2).size.should be(50)
  end

  context 'on invalid api key' do
    let!(:api) { ShufflerFM::API.new('NO-SUCH-KEY') }

    it 'throws exception' do
      expect { api.tracks }.to raise_error(ShufflerFM::Forbidden)
    end
  end
end