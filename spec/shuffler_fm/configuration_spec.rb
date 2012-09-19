describe ShufflerFM::Configuration do
  let!(:cfg) { ShufflerFM::Configuration.new }

  it 'has default values' do
    cfg.connection_timeout.should eq(2)
    cfg.read_timeout.should eq(5)
    cfg.proxy.should be_nil
  end
end