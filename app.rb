require 'xbox_video'

# gets and saves a random video every 25 seconds
client = XboxVideo::Client.new(ENV['XBOX_KEY'])

loop do
  path = client.download_random(path: './videos')
  puts "Downloaded video at #{path}"
  sleep 25
end