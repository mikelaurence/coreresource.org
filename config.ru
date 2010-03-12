require 'rubygems'
require 'sinatra'
require 'sinatra/mapping'
require 'sinatra/memcache'
require 'less'
require 'mongo'
require 'json'
require 'rdiscount'

# Note the application's root directory for convenience
ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)

# Logging
log = File.new('sinatra.log', 'a')
STDOUT.reopen(log)
STDERR.reopen(log)

# Database
DB = Mongo::Connection.new.db('CoreResource')
PINGS = DB.collection('pings')

# Memcached
set :cache_server, 'localhost:11211'
set :cache_namespace, "coreresource.org.#{Time.new.to_i}"
set :cache_enable, production?
set :cache_logging, true
set :cache_default_expiry, 60*60
set :cache_default_compress, true

require 'app'
run Sinatra::Application