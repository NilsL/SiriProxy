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
  listen_for /einschalten/i do
    say "Klimaanlage wurde eingeschaltet!", spoken: "Klimaanlage wurde eingeschaltet!"
    request_completed
    system("groupswrite ip:127.0.0.1 1/0/0 1")
  end

  # listener for deactivating the ac
  listen_for /ausschalten/i do
    say "Klimaanlage wurde ausgeschaltet!", spoken: "Klimaanlage wurde ausgeschaltet!"
    request_completed
    system("groupswrite ip:127.0.0.1 1/0/0 0")
  end

  # listener for activating the eibd server
  listen_for /knx einschalten/i do
    say "Eibd wurde eingeschaltet!", spoken: "Eibd wurde eingeschaltet!"
    request_completed
    system("eibd")
  end
end
