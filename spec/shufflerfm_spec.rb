describe ShufflerFM do
  it 'provides an API given an api key' do
    ShufflerFM.api(KEY).should be_a(ShufflerFM::API)
  end
end