# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shuffler_fm/version'

Gem::Specification.new do |gem|
  gem.name          = "shuffler_fm"
  gem.version       = ShufflerFM::VERSION
  gem.authors       = ["Miguel Guinada"]
  gem.email         = ["mguinada@gmail.com"]
  gem.description   = %q{ shuffler_fm wraps shuffler.fm's REST api on a thin layer of ruby. }
  gem.summary       = %q{ Ruby API wrapper for http://shuffler.fm }
  gem.homepage      = "https://github.com/mguinada/shuffler_fm"
  gem.date          = Time.now.utc.strftime("%Y-%m-%d")

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday',            '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.8'
  gem.add_dependency 'rash',               '~> 0.3'
  gem.add_dependency 'multi_json',         '~> 1.3'
end