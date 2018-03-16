require 'dotenv/load'
# Giphy api urls
GIPHY_URL = "http://api.giphy.com/v1/gifs/search?q="
GIPHY_API_KEY_URL = "&api_key=" + ENV["GIPHY_API_KEY"] +"&limit=1"
