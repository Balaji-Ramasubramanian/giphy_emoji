require './app'
require './config/initialize'
require './init'
require './lib/twitter_bot'
require 'rake'

# run regular sinatra 
run Sinatra::Application
