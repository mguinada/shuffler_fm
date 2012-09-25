describe ShufflerFM::API::Blogs do
  use_vcr_cassette :blogs

  let!(:api) { ShufflerFM::API.new(KEY) }

  it 'lists blogs' do
    api.blogs.should be_a(Array)
    api.blogs(:page => 2).should be_a(Array)
  end

  it 'lists featured blogs' do
    api.featured_blogs.should be_a(Array)
    api.featured_blogs(:page => 2).should be_a(Array)
  end

  it 'requests an particular blog' do
    api.blog(1).should be_a(Hashie::Mash)
    api.blog(0).should be_nil
  end

  it 'searches for a blog' do
    api.search_blogs('queen').should be_a(Array)
    api.search_blogs('queen', :page => 3).should be_a(Array)
  end
end