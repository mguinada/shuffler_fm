# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shuffler_fm/version'

Gem::Specification.new do |gem|
  gem.name          = "shuffler_fm"
  gem.version       = ShufflerFM::VERSION
  gem.authors       = ["Miguel Guinada"]
  gem.email         = ["mguinada@gmail.com"]
  gem.description   = %q{ Ruby API wrapper for http://shuffler.fm }
  gem.summary       = %q{ Ruby API wrapper for http://shuffler.fm }
  gem.homepage      = ""
  gem.date          = Time.now.utc.strftime("%Y-%m-%d")

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  #package
  gem.add_dependency 'faraday',            '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.8'
  gem.add_dependency 'hashie',             '~> 1.2'
  gem.add_dependency 'multi_json',         '~> 1.3'

  #development
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
end