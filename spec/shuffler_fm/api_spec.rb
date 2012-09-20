describe ShufflerFM::API do
  use_vcr_cassette :api

  it 'requires a key' do
    expect { ShufflerFM::API.new(KEY) }.not_to raise_error
  end

  context 'on invalid api key' do
    let!(:api) { ShufflerFM::API.new('NO-SUCH-KEY') }

    it 'throws exception' do
      expect { api.tracks }.to raise_error(ShufflerFM::Forbidden)
    end
  end
end