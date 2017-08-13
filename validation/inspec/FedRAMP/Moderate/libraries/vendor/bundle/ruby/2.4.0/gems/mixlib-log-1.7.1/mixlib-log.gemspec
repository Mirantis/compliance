$:.unshift File.expand_path("../lib", __FILE__)
require "mixlib/log/version"

Gem::Specification.new do |gem|
  gem.name = "mixlib-log"
  gem.version = Mixlib::Log::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.summary = "A gem that provides a simple mixin for log functionality"
  gem.email = "info@chef.io"
  gem.homepage = "https://www.chef.io"
  gem.license = "Apache-2.0"
  gem.authors = ["Chef Software, Inc."]
  gem.has_rdoc = true
  gem.extra_rdoc_files = ["README.md", "LICENSE", "NOTICE"]
  gem.files = Dir["lib/**/*"] + Dir["spec/**/*"] + ["Gemfile", "Rakefile", ".gemtest", "mixlib-log.gemspec"]
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 3.4"
  gem.add_development_dependency "chefstyle", "~> 0.3"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "github_changelog_generator", "1.11.3"
end
