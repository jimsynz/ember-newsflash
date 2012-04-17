guard :bundler do
  watch('Gemfile')
  watch(%r{^.+\.gemspec$})
end

guard :rspec, all_after_pass: false, all_on_start: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard :coffeescript, input: [ 'lib', 'spec' ]

guard :vows do
  watch(%r{spec/.+_spec\.js$})
  watch(%r{^lib/(.+)\.js$})     { |m| "spec/lib/#{m[1]}_spec.js"}
end
