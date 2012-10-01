# ShufflerFM [![Build Status](https://secure.travis-ci.org/mguinada/shuffler_fm.png?branch=master)](http://travis-ci.org/mguinada/shuffler_fm) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mguinada/shuffler_fm)

[travis]: http://travis-ci.org/mguinada/shuffler_fm
[codeclimate]: https://codeclimate.com/github/mguinada/shuffler_fm

Ruby API wrapper for [shuffler.fm v1 API](http://developers.shuffler.fm/)

## Installation

Add this line to your application's Gemfile:

    gem 'shuffler_fm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shuffler_fm

## Usage

### Create an API instance
```ruby

require 'shuffler_fm'

# Get and API key from http://shuffler.fm/developers
api = ShufflerFM.api('YOUR-KEY')
=> #<ShufflerFM::API:0x000000027fa2b8 @key="YOUR-KEY">
```

### Read track data
```ruby

# list tracks
tracks = api.tracks
=> [#<Hashie::Rash blog=#<Hashie::Rash about=\"\" channel_url=\"http://api.shuffler.fm/v1/channels/blog:963?api-key=YOUR-KEY\" genres=[\"indie\", \"folk\", \"singer-songwriter\"] id=963 images=[#<Hashie::Rash height=240 url=\"http://assets.shuffler.fm/feeds/963/argeheartedboy_large.jpg\" width=240>] permalink=\"largehearted-boy\" profiles=#<Hashie::Rash facebook=nil twitter=nil> ...

# list operations are paginated
tracks = api.tracks(page: 2)

# request a particular track
track = api.track(1134715)

track.blog.title
=> "Cover Freak"

track.post.url
=> "http://coverfreak.com/2012/09/23/satisfaction/"

track.metadata.title
=> "Satisfaction"

track.metadata.artist.name
=> "Bjork & PJ Harvey"
```

### Search for an artist
```ruby
api.search_artists('radiohead').map(&:name)
=> ["Radiohead", "Radiohead at Lollapalooza 2008", "REM & Radiohead", "Radiohead 6. Permanent Daylight live", "Radiohead @ Optimus Alive'12", "I Can't Take The Hurt (Johnny Cash vs Tegan and Sarah and Radiohead)"]
```

### Read a channel's activity stream
```ruby

activity = []
api.genre_channels('punk', 'rock').each do |act|
  activity << "#{act.verb.capitalize} on #{act.actor.title} refering music track #{act.object.metadata.title}"
end

activity
=> ["Post on The KEXP Blog refering music track Sunshine/Pretty Girls (Live on KEXP)",
    "Post on PropertyOfZack refering music track Always Summer (Live Video)",
    "Post on Nialler9 Music Blog refering music track Honningbarna (2012)",
    "Post on This Is Fake DIY refering music track Coffin Song", ...
```

and more ...

### Configuration
```ruby

ShufflerFM.configure do |config|
  config.connection_timeout = 1 #seconds
  config.read_timeout       = 5 #seconds
  config.proxy              = { uri: 'http://192.168.1.1:8080', user: 'user1', password: 'passwd'}
end

#or

api = ShufflerFM.api("your-api-key", connection_timeout: 1, read_timeout: 5, proxy: 'http://192.168.1.1:8080')
```

## Reference

[shuffler_fm reference](http://rdoc.info/github/mguinada/shuffler_fm)

## Contributing

1. Fork it
2. Create your topic branch (`git checkout -b my-topic-branch`)
3. Add/change specs for your unimplemented feature or bug fix
4. Make sure specs fail by running `bundle exec rake spec`. If not return to step 3
5. Hack it
6. Make sure specs pass (`bundle exec rake spec`). If not return to step 5
7. Edit the documentation so it is coherent with your feature or fix. Run `bundle exec rake yard` to review
8. Commit changes (`git commit -am 'Add some feature/fix'`) and push to the branch (`git push origin my-topic-branch`)
9. Submit a pull request for your branch.

## Influence

This API wrapper design is strongly influenced by the [Ocktokit gem](https://github.com/pengwynn/octokit)

## Copyright
Copyright (c) 2012 Miguel Guinada
[LICENSE][] for details.

[license]: https://github.com/mguinada/shuffler_fm/blob/master/LICENSE