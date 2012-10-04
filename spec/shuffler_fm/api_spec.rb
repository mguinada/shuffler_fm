describe ShufflerFM::API do
  use_vcr_cassette :api

  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'requires a key' do
    expect { ShufflerFM::API.new(KEY) }.not_to raise_error
  end

  context 'on invalid api key' do
    let!(:api) { ShufflerFM::API.new('NO-SUCH-KEY') }

    it 'throws exception' do
      expect { api.tracks }.to raise_error(ShufflerFM::Forbidden)
    end
  end

  context 'paginates lists' do
    it 'default is the first page' do
      api.tracks.first.should eq(api.tracks(:page => 1).first)
    end

    it 'default page size is 50' do
      api.tracks.size.should be(50)
    end

    it 'page size is a parameter' do
      api.tracks(:page => 2, :per_page => 10).size.should be(10)
    end
  end
end