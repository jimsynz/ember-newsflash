#!/usr/bin/env rake

namespace :npm do
  file 'node_modules' => [ 'package.json' ] do
    `npm install`
  end
  task install: :node_modules do
  end
end

require "bundler/gem_tasks"
