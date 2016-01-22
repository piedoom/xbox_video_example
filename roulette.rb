require 'xbox_video'

# gets and saves a random video every 25 seconds
client = XboxVideo::Client.new(ENV['XBOX_KEY'])

loop do
  video = client.get_videos.sample
  # only works with linux!
  system("xdg-open", video.clips.first.uri)
  puts "Showing video from game #{video.game}"
  sleep video.duration + 3
end