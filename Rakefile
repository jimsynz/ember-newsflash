#!/usr/bin/env rake

namespace :npm do
  file 'node_modules' => [ 'package.json' ] do
    `npm install`
  end
  task install: :node_modules do
  end
end

namespace :browserify do
  file 'spec/fixtures/html/browserify.js' => Dir.glob('spec/fixtures/html/javascripts/**/*') do
    `browserify -o spec/fixtures/html/browserify.js spec/fixtures/html/javascripts/app.coffee`
  end
  task acceptance: 'spec/fixtures/html/browserify.js'
end

require "bundler/gem_tasks"
