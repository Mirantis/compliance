# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'semverse/gem_version'

Gem::Specification.new do |spec|
  spec.name          = "semverse"
  spec.version       = Semverse::VERSION
  spec.authors       = ["Jamie Winsor"]
  spec.email         = ["jamie@vialstudios.com"]
  spec.summary       = %q{An elegant library for representing and comparing SemVer versions and constraints}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/berkshelf/semverse"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.1.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
