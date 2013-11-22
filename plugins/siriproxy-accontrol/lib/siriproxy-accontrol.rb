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
    system("ssh knxmaster@192.168.1.6 -t 'groupswrite ip:127.0.0.1 1/0/0 1'")
  end

  # listener for deactivating the ac
  listen_for /power off/i do
    say "Air conditioner deactivated!", spoken: "Air conditioner deactivated!"
    request_completed
    system("ssh knxmaster@192.168.1.6 -t 'groupswrite ip:127.0.0.1 1/0/0 0'")
  end

  # listener for activating the eibd server
  listen_for /eibd on/i do
    say "Eibd activated!", spoken: "Eibd activated!"
    request_completed
    system("ssh knxmaster@192.168.1.6 -t 'eibd -c -d/LOG-DIR/log.txt -i -S -D --no-tunnel-client-queuing -R -T'")
  end
end
