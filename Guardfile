guard :bundler do
  watch('Gemfile')
  watch(%r{^.+\.gemspec$})
end

guard :rspec, all_after_pass: false, all_on_start: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard :coffeescript, input: 'lib'
guard :coffeescript, input: 'spec', bare: true
guard :coffeescript, input: 'features', bare: true

guard :vows, all_after_pass: false, all_on_start: false do
  watch(%r{^spec/.+_spec\.js$})
  watch(%r{^lib/(.+)\.js$})     { |m| "spec/lib/#{m[1]}_spec.js"}
end

guard :rake, :task => 'npm:install' do
  watch('package.json')
end

guard 'cucumber-js', all_after_pass: false, all_on_start: false do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+\.js$}) { 'features' }
  watch(%r{^features/step_definitions/(.+)\.js$}) { |m| "features/#{m[1]}.feature" }
end
