# I've already created a string variable above: pirate_weather_api_key
# It contains sensitive credentials that hackers would love to steal so it is hidden for security reasons.


pp "Where are you ?"
user_location = gets.chomp

#user_location = "chicago"


maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" +
 ENV.fetch("GMAPS_KEY")

 #pp maps_url

require "http"

resp = HTTP.get(maps_url)

raw_response =  resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

#pp parsed_response.keys

 result = parsed_response.fetch("results")

first_result = result.at(0)

 geo =  first_result.fetch("geometry")


loc = geo.fetch("location")

 latitude =  loc.fetch("lat")

 longitude  = loc.fetch("lng")

 puts "Checking the weather at #{user_location}...."
 puts "Your coordinates are #{latitude}, #{longitude}"

 pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")


 pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{latitude},#{longitude}"

resp_weather = HTTP.get(pirate_weather_url)
resp_r = resp_weather.to_s

 parse_resp = JSON.parse(resp_r)

 pp currently_hash = parse_resp.fetch("currently")
 pp currently_temp = currently_hash.fetch("temperature")

 puts "It is currently #{currently_temp }°F."



 ##parse_r = parse_resp.to_s
 
  ##pp parse_resp.keys

  #wea = parse_resp.fetch(currently)
