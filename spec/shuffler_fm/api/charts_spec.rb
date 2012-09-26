describe ShufflerFM::API::Charts do
  use_vcr_cassette :charts

  let!(:api) { ShufflerFM.api(KEY) }

  it 'lists popular charts' do
    api.popular_charts.should be_a(Array)
    api.popular_charts(:page => 2).should be_a(Array)
  end

  it 'lists tracks that were recently added to the popular list' do
    api.popular_charts_newest.should be_a(Array)
    api.popular_charts_newest(:page => 2).should be_a(Array)
  end
end