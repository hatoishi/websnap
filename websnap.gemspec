# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "websnap/version"

Gem::Specification.new do |s|
  s.name = "websnap"
  s.version = "0.1.4"
  s.authors = ["Francis Chong"]
  s.date = "2011-11-24"
  s.description = "Create snapshot of webpage"
  s.email = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.homepage = "http://github.com/siuying/websnap"
  s.summary = "Create snapshot of webpage"

  s.add_development_dependency "rspec", "~> 2.8.0"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rack-test", ">= 0.5.6"
  s.add_development_dependency "activesupport", ">= 3.0.8"
end

