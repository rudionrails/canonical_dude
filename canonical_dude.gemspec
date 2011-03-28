# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "canonical_dude/version"

Gem::Specification.new do |s|
  s.name        = "canonical_dude"
  s.version     = CanonicalDude::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rudolf Schmidt"]
  
  s.homepage    = "http://github.com/rudionrails/canonical_dude"
  s.summary     = %q{Easy canonical URL generation}
  s.description = %q{canonical_dude is a Rails plugin to easily set your preferred version of a URL via the canonical tag}

  s.rubyforge_project = "canonical_dude"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~> 2.5.0'
end
