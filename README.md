# ShufflerFM  [![Build Status](https://secure.travis-ci.org/mguinada/shuffler_fm.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/mguinada/shuffler_fm.png?travis)][gemnasium] [![Code Climate](https://codeclimate.com/badge.png)][codeclimate]

[travis]: http://travis-ci.org/mguinada/shuffler_fm
[gemnasium]: https://gemnasium.com/mguinada/shuffler_fm
[codeclimate]: https://codeclimate.com/github/mguinada/shuffler_fm

Ruby API wrapper for [shuffler.fm API](http://developers.shuffler.fm/)

## Notice

This project is not at is productive state yet. Not all of shuffler.fm API is implemented
and current implementation may be subject of change.

## Installation

Add this line to your application's Gemfile:

    gem 'shuffler_fm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shuffler_fm

## Usage

### Get a track data
```ruby
require 'shuffler_fm'

# Get and API key from http://shuffler.fm/developers
api = ShufflerFM.api('YOUR-KEY')

t = api.tracks.first

t.metadata.title
=> "My Head"

t.metadata.artist.name
=> "Mock & Toof"
```

### Get a channel activity stream
```ruby
c = api.genre_channels('punk', 'rock', page: 2).first

c.actor.object_type
=> "blog"
c.verb
=> "post"
c.object.object_type
=> "track"
c.target.object_type
=> "blog_post"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Hack it
4. Add tests and make sure everything still passes by running rake
5. Do not change the version number, we will do that on our end
6. Commit your changes (`git commit -am 'Add some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Send a pull request for your branch

## Influence

This API wrapper design is strongly influenced by [Wynn Netherland's](https://github.com/pengwynn) [Ocktokit gem](https://github.com/pengwynn/octokit)