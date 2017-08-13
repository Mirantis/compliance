require "bundler/gem_tasks"
require "rdoc/task"
require "rspec/core/rake_task"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec

# For rubygems-test
task :test => :spec

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "mixlib-log #{Mixlib::Log::VERSION}"
  rdoc.rdoc_files.include("README*")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

begin
  require "chefstyle"
  require "rubocop/rake_task"
  RuboCop::RakeTask.new(:style) do |task|
    task.options += ["--display-cop-names", "--no-color"]
  end
rescue LoadError
  puts "chefstyle/rubocop is not available.  gem install chefstyle to do style checking."
end

require "github_changelog_generator/task"

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.future_release = Mixlib::Log::VERSION
  config.enhancement_labels = "enhancement,Enhancement,New Feature,Feature".split(",")
  config.bug_labels = "bug,Bug,Improvement,Upstream Bug".split(",")
  config.exclude_labels = "duplicate,question,invalid,wontfix,no_changelog,Exclude From Changelog,Question,Discussion".split(",")
end
