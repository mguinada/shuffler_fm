require 'simplecov'
require 'yaml'
require 'webmock/rspec'
require 'vcr'
require 'pry'

#setup simplecov
SimpleCov.start do
  add_filter "/spec"
end

require File.expand_path('../../lib/shuffler_fm', __FILE__)

# load config
begin
  cfg = YAML::load(File.open(File.expand_path('../config.yml', __FILE__)))
  raise "Couldn't find a key" if cfg['key'].nil?
  KEY = cfg['key']
rescue Errno::ENOENT
  puts "Couldn't find a configuration."
  exit(-1)
end


# setup VCR
VCR.configure do |cfg|
  cfg.filter_sensitive_data('<api-key>') { KEY }
  cfg.default_cassette_options = { :record => :new_episodes,
                                   :re_record_interval => 7 * 24 * 60 * 60 }
  cfg.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  cfg.hook_into :webmock
end

# add VCR macros to rspec
RSpec.configure do |cfg|
  cfg.extend VCR::RSpec::Macros
end