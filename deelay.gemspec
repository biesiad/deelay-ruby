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
  s.summary     = %q{Delay proxy}
  s.description = %q{Delay proxy for http resources}

  s.rubyforge_project = "deelay"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'async_sinatra'
end
