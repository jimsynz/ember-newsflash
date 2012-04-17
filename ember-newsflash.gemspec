# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ember-newsflash/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James Harton"]
  gem.email         = ["jamesotron@gmail.com"]
  gem.description   = %q{Realtime sychronisation between an ember client and server using Faye.}
  gem.summary       = %q{Realtime ember magic}
  gem.homepage      = "https://github.com/jamesotron/ember-newflash"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ember-newsflash"
  gem.require_paths = ["lib"]
  gem.version       = Ember::Newsflash::VERSION

  gem.add_dependency 'faye', '~> 0.8.2'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'guard-coffeescript'
  gem.add_development_dependency 'guard-vows'
  gem.add_development_dependency 'guard-cucumber-js'
  gem.add_development_dependency 'guard-rake'
  gem.add_development_dependency 'therubyracer'
end
