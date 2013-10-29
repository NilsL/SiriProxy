# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-accontrol"
  s.version     = "0.0.1" 
  s.authors     = ["Nils Lutz"]
  s.email       = ["Mail.NLutz@gmail.com"]
  s.homepage    = "http://about.me/nlutz"
  s.summary     = %q{Air conditioner control}
  s.description = %q{This is a plugin to control a Delkin AC. Delkin AC is implemented into the existing network through a KNX IP Interface/ClicDD. So it should either work with direct eibd terminal commands or JSON requests controlling a webserver on eibd server machine. }

  s.rubyforge_project = "siriproxy-accontrol"

  s.files         = `git ls-files 2> /dev/null`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/* 2> /dev/null`.split("\n")
  s.executables   = `git ls-files -- bin/* 2> /dev/null`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
