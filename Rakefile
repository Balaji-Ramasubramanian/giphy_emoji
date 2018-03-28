require './app'
require 'rake'
require 'sinatra/activerecord'
require 'httparty'
require 'json'
require 'date'
require_relative './emojis.rb'


task :hit_url do
	#Hits the url provided inorder to keep the heroku app up and running
	res = HTTParty.get("https://giphy-emoji.herokuapp.com")
end

task :daily_tweet do
	#Tweet random gif 
	send_daily_tweet #This method resides in emojis.rb file
end
