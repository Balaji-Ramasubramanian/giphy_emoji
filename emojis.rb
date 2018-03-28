require 'twitter'
require 'dotenv/load'
require 'httparty'
require 'gemoji'
require_relative './utils'
require_relative './config/initialize.rb'

#List of emojis 
EMOJIS = ['😀','😁','😂','🤣','😃',
		'😄','😅','😆','😉','😊',
		'😋','😎','😍','😘','😗',
		'😙','😚','🤔','😐','😑',
		'😶','🙄','😏','😣','😥',
		'😮','🤐','😯','😪','😫',
		'😴','😌','😛','😜','😝',
		'🤤','😒','😓','😔','😕',
		'🙃','🤑','😲','🙁','😖',
		'😞','😟','😤','😢','😭',
		'😧','😨','😩','😬','😰',
		'😱','😳','😵','😡','😠',
		'😷','🤒','🤕','🤢','😦',
		'🤧','😇','🤠','🤡','🤥',
		'🤓','😈','👿','👹','💩',
		'👺','💀','👻','👽','🤖',
		'😺','😸','😹','😻','😼',
		'🙀','😿','😾','😽'].freeze

#Tweet with a gif for a random emoji selected from the above list of emojis
def send_daily_tweet

	rand_number = rand(EMOJIS.length)
	emoji_text = Emoji.find_by_unicode(EMOJIS[rand_number]).name
	giphy_response = HTTParty.get(GIPHY_URL + emoji_text + GIPHY_API_KEY_URL)
	giphy_response = giphy_response.body
	giphy_parsed_response = JSON.parse(giphy_response)
	gif = giphy_parsed_response["data"][0]["url"]
	$rest_client.update("Hey all! check out today's gif! #{gif}")

end