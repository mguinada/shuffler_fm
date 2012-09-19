describe ShufflerFM do
  it 'provides an API given an api key' do
    ShufflerFM.api(KEY).should be_a(ShufflerFM::API)
  end

  context 'is configurable' do
    it 'with a block' do
      ShufflerFM.configure do |cfg|
        cfg.connection_timeout = 1 #seconds
        cfg.read_timeout       = 5 #seconds
        cfg.proxy              = 'http://192.168.1.1:8080'
      end

      ShufflerFM.configuration.values.should eq(connection_timeout: 1,
                                                read_timeout: 5,
                                                proxy: 'http://192.168.1.1:8080')
    end

    it 'with a hash' do
      ShufflerFM.api(KEY, connection_timeout: 2, read_timeout: 3, proxy: 'http://127.0.0.1:8888')

      ShufflerFM.configuration.connection_timeout.should eq(2)
      ShufflerFM.configuration.read_timeout.should eq(3)
      ShufflerFM.configuration.proxy.should eq('http://127.0.0.1:8888')
    end
  end
end