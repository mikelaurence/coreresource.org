require 'rubygems'
require 'sinatra'
require 'sinatra/mapping'

log = File.new('sinatra.log', 'a')
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app'
run Sinatra::Application