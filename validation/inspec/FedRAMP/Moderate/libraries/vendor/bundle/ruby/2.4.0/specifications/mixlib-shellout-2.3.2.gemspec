# -*- encoding: utf-8 -*-
# stub: mixlib-shellout 2.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "mixlib-shellout".freeze
  s.version = "2.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software Inc.".freeze]
  s.date = "2017-07-21"
  s.description = "Run external commands on Unix or Windows".freeze
  s.email = "info@chef.io".freeze
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze]
  s.homepage = "https://www.chef.io/".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Run external commands on Unix or Windows".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<chefstyle>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<chefstyle>.freeze, [">= 0"])
  end
end
