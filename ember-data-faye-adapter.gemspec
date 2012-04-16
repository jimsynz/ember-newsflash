# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ember-data-faye-adapter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James Harton"]
  gem.email         = ["jamesotron@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ember-data-faye-adapter"
  gem.require_paths = ["lib"]
  gem.version       = Ember::Data::Faye::Adapter::VERSION

  gem.add_dependency 'faye', '~> 0.8.2'

  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
end