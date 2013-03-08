# -*- encoding: utf-8 -*-
require File.expand_path('../lib/canonical_dude/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "canonical_dude"
  s.version     = CanonicalDude::VERSION
  s.authors     = ["Rudolf Schmidt"]

  s.homepage    = "http://github.com/rudionrails/canonical_dude"
  s.summary     = %q{Easy canonical URL generation}
  s.description = %q{canonical_dude is a Rails plugin to easily set your preferred version of a URL via the canonical tag}

  s.rubyforge_project = "canonical_dude"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2"
end

