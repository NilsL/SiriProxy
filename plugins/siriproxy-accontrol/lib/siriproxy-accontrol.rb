require 'cora'
require 'siri_objects'
require 'pp'

#######
# This plugin controls a Daikin air conditioner. It either sends direct
# eibd commands or contact the eibd machine with JSON
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::ACControl < SiriProxy::Plugin
  def initialize(config)
  end
  
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"
  end
    
  # listener for activating the ac
  listen_for /power on/i do
    say "Air conditioner activated!", spoken: "Air conditioner activated!"
    request_completed
    # TODO: either direct eibd command or JSON request
    # system("eibd ")
  end

  # listener for deactivating the ac
  listen_for /power off/i do
    say "Air conditioner deactivated!", spoken: "Air conditioner!"
    request_completed
    # TODO: either direct eibd command or JSON request
    # system("eibd ")
  end
end
