# encoding: UTF-8
require 'date'

version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'winrm-fs'
  s.version = version
  s.date		= Date.today.to_s

  s.author = ['Shawn Neal', 'Matt Wrock']
  s.email = ['sneal@sneal.net', 'matt@mattwrock.com']
  s.homepage = 'http://github.com/WinRb/winrm-fs'

  s.summary = 'WinRM File System'
  s.description	= <<-EOF
    Ruby library for file system operations via Windows Remote Management
  EOF

  s.files = `git ls-files`.split(/\n/)
  s.require_path = 'lib'
  s.rdoc_options	= %w(-x test/ -x examples/)
  s.extra_rdoc_files = %w(README.md LICENSE)

  s.bindir = 'bin'
  s.executables   = ['rwinrmcp']
  s.required_ruby_version	= '>= 1.9.0'
  s.add_runtime_dependency 'erubis', '~> 2.7'
  s.add_runtime_dependency 'logging', ['>= 1.6.1', '< 3.0']
  s.add_runtime_dependency 'rubyzip', '~> 1.1'
  s.add_runtime_dependency 'winrm', '~> 2.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 3.0.0'
  s.add_development_dependency 'rake', '~> 10.3.2'
  s.add_development_dependency 'rubocop', '~> 0.28.0'
end
