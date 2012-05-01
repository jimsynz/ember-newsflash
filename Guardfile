guard :bundler do
  watch('Gemfile')
  watch(%r{^.+\.gemspec$})
end

guard :rspec, all_after_pass: false, all_on_start: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard :coffeescript do
  watch("lib/**/*.coffee") { 'lib/ember-newsflash.coffee' }
end
#guard :coffeescript, input: 'spec'

guard :vows, all_after_pass: false, all_on_start: false do
  #watch(%r{^spec/.+_spec\.js$})
  #watch(%r{^lib/(.+)\.js$})     { |m| "spec/lib/#{m[1]}_spec.js"}
  watch(%r{^spec/.+_spec\.coffee$})
  watch(%r{^lib/(.+)\.coffee$})     { |m| "spec/lib/#{m[1]}_spec.coffee"}
end

guard :rake, :task => 'npm:install' do
  watch('package.json')
end

guard :rake, task: 'browserify:acceptance' do
  watch('spec/fixtures/html/javascripts/**/*')
end

guard 'cucumber-js', all_after_pass: false, all_on_start: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+\.(js||coffee)$}) { 'features' }
  watch(%r{^features/step_definitions/(.+)\.(coffee||js)$}) { |m| "features/#{m[1]}.feature" }
  watch("spec/fixtures/html/**/*") { 'features' }
end
