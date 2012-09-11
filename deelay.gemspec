# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "deelay/version"
require "deelay/homepage"

Gem::Specification.new do |s|
  s.name        = "deelay"
  s.version     = Deelay::VERSION
  s.authors     = ["Grzegorz Biesiadecki"]
  s.email       = ["gbiesiadecki@gmail.com"]
  s.homepage    = Deelay::HOMEPAGE
  s.summary     = %q{Delaying proxy for http resources}
  s.description = %q{With Deelay you can delay loading web resources with specified time}

  s.rubyforge_project = "deelay"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
