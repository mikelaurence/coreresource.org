require 'rubygems'
require 'sinatra'
require 'sinatra/mapping'
require 'less'
require 'mongo'
require 'json'

# Note the application's root directory for convenience
ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)

log = File.new('sinatra.log', 'a')
STDOUT.reopen(log)
STDERR.reopen(log)

DB = Mongo::Connection.new.db('CoreResource')
PINGS = DB.collection('pings')

require 'app'
run Sinatra::Application