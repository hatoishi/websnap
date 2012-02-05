# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "websnap/version"

Gem::Specification.new do |s|
  s.name = "websnap"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Francis Chong"]
  s.date = "2011-11-24"
  s.description = "Create snapshot of webpage"
  s.email = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.extra_rdoc_files = ["LICENSE", "README.md", "bin/wkhtmltoimage-linux-i386-0.10.0", "bin/wkhtmltoimage-osx-i386-0.10.0", "bin/wkhtmltoimage-proxy", "lib/websnap.rb", "lib/websnap/source.rb", "lib/websnap/websnap.rb"]

  s.homepage = "http://github.com/siuying/websnap"
  
  s.rubyforge_project = "websnap"
  s.rubygems_version = "1.8.10"
  s.summary = "Create snapshot of webpage"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rack-test", ">= 0.5.6"
  s.add_development_dependency "activesupport", ">= 3.0.8"
end


