describe ShufflerFM::Middleware::ErrorHandler do
  use_vcr_cassette :tracks

  @errors = { 400 => ShufflerFM::BadRequest,
              401 => ShufflerFM::Unauthorized,
              403 => ShufflerFM::Forbidden,
              404 => ShufflerFM::NotFound,
              406 => ShufflerFM::NotAcceptable,
              422 => ShufflerFM::UnprocessableEntity,
              429 => ShufflerFM::TooManyRequests,
              500 => ShufflerFM::InternalServerError,
              501 => ShufflerFM::NotImplemented,
              502 => ShufflerFM::BadGateway,
              503 => ShufflerFM::ServiceUnavailable }

  @errors.each do |status, error|
    context "on response status #{status}" do
      let!(:api) { ShufflerFM::API.new(KEY) }

      before(:each) do
        stub_request(:get, "http://api.shuffler.fm/v1/tracks?api-key=#{KEY}&page=0").to_return(:status => status)
      end

      it "should raise #{error.name}" do
        expect { api.tracks }.to raise_error(error)
      end
    end
  end
end
