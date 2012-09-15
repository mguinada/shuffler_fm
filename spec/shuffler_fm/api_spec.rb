describe ShufflerFM::API do
  use_vcr_cassette
  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'lists tracks' do
    api.tracks.should_not be_empty
  end

  context 'on invalid api key' do
    let!(:api) { ShufflerFM::API.new('NO-SUCH-KEY') }

    it 'throws exception' do
      expect { api.tracks }.to raise_error(ShufflerFM::Forbidden)
    end
  end
end