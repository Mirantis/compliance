# -*- encoding: utf-8 -*-
# stub: mixlib-log 1.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mixlib-log".freeze
  s.version = "1.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software, Inc.".freeze]
  s.date = "2016-08-12"
  s.email = "info@chef.io".freeze
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze, "NOTICE".freeze]
  s.files = ["LICENSE".freeze, "NOTICE".freeze, "README.md".freeze]
  s.homepage = "https://www.chef.io".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "A gem that provides a simple mixin for log functionality".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<chefstyle>.freeze, ["~> 0.3"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_development_dependency(%q<github_changelog_generator>.freeze, ["= 1.11.3"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
      s.add_dependency(%q<chefstyle>.freeze, ["~> 0.3"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<github_changelog_generator>.freeze, ["= 1.11.3"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<chefstyle>.freeze, ["~> 0.3"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<github_changelog_generator>.freeze, ["= 1.11.3"])
  end
end
