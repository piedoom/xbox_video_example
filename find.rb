require 'xbox_video'
require 'colorize'
# gets and saves a random video every 25 seconds
client = XboxVideo::Client.new(ENV['XBOX_KEY'])

start = 572802557

BASE_URL = 'https://gameclipsmetadata.xboxlive.com'

loop do

  uri = "#{BASE_URL}/public/titles/#{start}/clips?qualifier=created&type=userGenerated"
  response = RestClient.get(uri, :'Authorization' => ENV['XBOX_KEY'], :'contract_version' => 2)
  response = JSON.parse(response)
  if response['gameClips'] == []
    puts "Nothing for #{start}"
  else
    #puts response['gameClips']['titleId']
    puts "FOUND #{response['gameClips'][0]['titleName']} AT #{start} - #{response['gameClips'][0]['gameClipId']}".green
    p response['gameClips'].first
  end

  start += 1

end