# ShufflerFM

[![Build Status](https://secure.travis-ci.org/mguinada/shuffler_fm.png)](http://travis-ci.org/mguinada/shuffler_fm)
[![Dependency Status](https://gemnasium.com/mguinada/shuffler_fm.png)](https://gemnasium.com/mguinada/shuffler_fm)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mguinada/shuffler_fm)

[travis]: http://travis-ci.org/mguinada/shuffler_fm
[gemnasium]: https://gemnasium.com/mguinada/shuffler_fm
[codeclimate]: https://codeclimate.com/github/mguinada/shuffler_fm

Ruby API wrapper for [shuffler.fm API](http://developers.shuffler.fm/)

## Notice

This project is not at is productive state yet. Not all of shuffler.fm API is implemented
and current implementation may be subject of change.

## Documentation

[API Reference](http://rdoc.info/github/mguinada/shuffler_fm)

## Installation

Add this line to your application's Gemfile:

    gem 'shuffler_fm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shuffler_fm

## Usage

### Get an API instance
```ruby
require 'shuffler_fm'

# Get and API key from http://shuffler.fm/developers
api = ShufflerFM.api('YOUR-KEY')
=> #<ShufflerFM::API:0x000000027fa2b8 @key="YOUR-KEY">

```

### Get track data
```ruby

# list tracks
tracks = api.tracks

[#<Hashie::Rash blog=#<Hashie::Rash about=\"\" channel_url=\"http://api.shuffler.fm/v1/channels/blog:963?api-key=8ivutyt47ehvhl0kiebh\" genres=[\"indie\", \"folk\", \"singer-songwriter\"] id=963 images=[#<Hashie::Rash height=240 url=\"http://assets.shuffler.fm/feeds/963/argeheartedboy_large.jpg\" width=240>] permalink=\"largehearted-boy\" profiles=#<Hashie::Rash facebook=nil twitter=nil> ...

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

### Make an artist search
```ruby
api.search_artists('radiohead').map(&:name)

=> ["Radiohead", "Radiohead at Lollapalooza 2008", "REM & Radiohead", "Radiohead 6. Permanent Daylight live", "Radiohead @ Optimus Alive'12", "I Can't Take The Hurt (Johnny Cash vs Tegan and Sarah and Radiohead)"]

```

### Get a channel activity stream
```ruby
activity = []
api.genre_channels('punk', 'rock').each do |act|
  activity << "#{act.verb} on #{act.actor.title} refering music track #{act.object.metadata.title}"
end

=> ["Post at The KEXP Blog refering music track Sunshine/Pretty Girls (Live on KEXP)",
    "Post at PropertyOfZack refering music track Always Summer (Live Video)",
    "Post at Nialler9 Music Blog refering music track Honningbarna (2012)",
    "Post at This Is Fake DIY refering music track Coffin Song", ...

```

## Contributing

1. Fork it
2. Create your topic branch (`git checkout -b my-topic-branch`)
3. Add/change specs for your unimplemented feature or bug fix.
4. Make sure specs fail by runnig `bundle exec rake spec`. If not return to step 3
5. Hack it
6. Make sure specs pass (`bundle exec rake spec`). If not return to step 5
7. Do not change the version number, we will do that
8. Add documentation for your feature or fix
9. Run `bundle exec rake yard` and review the documentation.
10. Commit your changes (`git commit -am 'Add some feature/fix'`)
11. Push to the branch (`git push origin my-topic-branch`)
12. Submit a pull request for your branch

## Influence

This API wrapper design is strongly influenced by [Wynn Netherland's](https://github.com/pengwynn) [Ocktokit gem](https://github.com/pengwynn/octokit)

## Copyright
Copyright (c) 2012 Miguel Guinada
[LICENSE][] for details.

[license]: https://github.com/mguinada/shuffler_fm/blob/master/LICENSE