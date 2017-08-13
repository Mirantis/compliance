source "https://rubygems.org"

gemspec

group :development do
  gem "fuubar"
  gem "yard"
  gem "guard-rspec"
  gem "guard-spork"
  gem "coolline"

  require "rbconfig"

  if RbConfig::CONFIG["target_os"] =~ /darwin/i
    gem "ruby_gntp", require: false

  elsif RbConfig::CONFIG["target_os"] =~ /linux/i
    gem "libnotify", require: false

  elsif RbConfig::CONFIG["target_os"] =~ /mswin|mingw/i
    gem "win32console", require: false
  end
end

group :test do
  gem "spork"
  gem "rake"
  gem "rspec", "~> 3.0"
end
