guard 'spork', rspec_port: 8991 do
  watch('Gemfile')
  watch('spec/spec_helper.rb')  { :rspec }
end

guard 'rspec', cli: "--color --drb --drb-port 8991 --format Fuubar", all_on_start: false, all_after_pass: false, notification: false do
  watch(%r{^spec/acceptance/.+_spec\.rb$})
  watch(%r{^spec/unit/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})          { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')       { "spec" }
end
