# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cached_scopes/version"

Gem::Specification.new do |s|
  s.name        = "cached_scopes"
  s.version     = CachedScopes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Clemens Kofler"]
  s.email       = ["clemens@railway.at"]
  s.homepage    = "http://www.railway.at"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.add_dependency('activerecord', '>= 3.0.0')
  s.add_dependency('activesupport', '>= 3.0.0')

  s.rubyforge_project = "cached_scopes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
