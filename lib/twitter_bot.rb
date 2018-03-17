require 'twitter'
require 'dotenv/load'
require 'httparty'
require 'gemoji'
require_relative '../utils'
require_relative '../config/initialize.rb'

class TwitterBot

	# Handle the events occured in twitter
	def handle_events
		$client.user do |obj|
			case obj
			when Twitter::Tweet		
				puts "status id #{obj.id}"
				puts "text #{obj.text}"
				puts "User Id #{obj.user.id}"
				puts "User Name #{obj.user.screen_name}"
				puts "user_mentions #{obj.user_mentions[0].screen_name.to_s}"
				# Below code triggers when user mention occured
				if obj.user_mentions? && obj.user_mentions[0].screen_name.to_s == "giphy_emoji"
					puts obj.user_mentions.to_s
					text = obj.text.gsub("@giphy_emoji","")
					text = text.gsub("_","+")
					text = text.strip
					puts "#{text}"
					begin
						emoji_text = Emoji.find_by_unicode("#{text}").name
						puts "#{emoji_text}"
						giphy_response = HTTParty.get(GIPHY_URL + emoji_text + GIPHY_API_KEY_URL)
						giphy_response = giphy_response.body
						giphy_parsed_response = JSON.parse(giphy_response)
						gif = "#{giphy_parsed_response["data"][0]["url"]}"
						$rest_client.update("@#{obj.user.screen_name} #{gif}",options = { :in_reply_to_status_id => "#{obj.id}"})
					rescue Exception => e
						puts "Exception Occured!"
						puts "#{emoji_text}"
						$rest_client.update("@#{obj.user.screen_name} Hey, send me any other emoji I'll send you related gifs!",options = { :in_reply_to_status_id => "#{obj.id}"})
					end
				end
				break
			end
		end
		handle_events
	end

end


