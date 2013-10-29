require 'cora'
require 'siri_objects'
require 'pp'

#######
# This plugin controls a Delkin air conditioner. It either sends direct
# eibd commands or contact the eibd machine with JSON
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::ACControl < SiriProxy::Plugin
  def initialize(config)
  end

  # listener for activating the ac
  listen_for /Klimaanlage einschalten /i do
    say "Die Klimaanlage wird eingeschaltet!"
    request_completed
    # TODO: either direct eibd command or JSON request
    system()
  end

  # listener for deactivating the ac
  listen_for /Klimaanlage ausschalten /i do
    say "Die Klimaanlage wird ausgeschaltet!"
    request_completed
    # TODO: either direct eibd command or JSON request
    system()
  end
end
