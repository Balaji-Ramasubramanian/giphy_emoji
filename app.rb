require 'sinatra'
require 'rake'
require 'dotenv/load'
require_relative './lib/twitter_bot.rb'

# Start the twitter event handler
get '/' do
  "This is GiphyEmoji Twitter bot site"
  t = TwitterBot.new
  t.handle_events
end
