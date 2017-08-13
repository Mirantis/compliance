# -*- encoding: utf-8 -*-
# stub: winrm 2.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "winrm".freeze
  s.version = "2.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Wanek".freeze, "Paul Morton".freeze, "Matt Wrock".freeze, "Shawn Neal".freeze]
  s.date = "2017-05-09"
  s.description = "    Ruby library for Windows Remote Management\n".freeze
  s.email = ["dan.wanek@gmail.com".freeze, "paul@themortonsonline.com".freeze, "matt@mattwrock.com".freeze, "sneal@sneal.net".freeze]
  s.executables = ["rwinrm".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/rwinrm".freeze]
  s.homepage = "https://github.com/WinRb/WinRM".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rdoc_options = ["-x".freeze, "test/".freeze, "-x".freeze, "examples/".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Ruby library for Windows Remote Management".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gssapi>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<httpclient>.freeze, [">= 2.2.0.2", "~> 2.2"])
      s.add_runtime_dependency(%q<rubyntlm>.freeze, [">= 0.6.1", "~> 0.6.0"])
      s.add_runtime_dependency(%q<logging>.freeze, ["< 3.0", ">= 1.6.1"])
      s.add_runtime_dependency(%q<nori>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<gyoku>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<builder>.freeze, [">= 2.1.2"])
      s.add_runtime_dependency(%q<erubis>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.39.0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
    else
      s.add_dependency(%q<gssapi>.freeze, ["~> 1.2"])
      s.add_dependency(%q<httpclient>.freeze, [">= 2.2.0.2", "~> 2.2"])
      s.add_dependency(%q<rubyntlm>.freeze, [">= 0.6.1", "~> 0.6.0"])
      s.add_dependency(%q<logging>.freeze, ["< 3.0", ">= 1.6.1"])
      s.add_dependency(%q<nori>.freeze, ["~> 2.0"])
      s.add_dependency(%q<gyoku>.freeze, ["~> 1.0"])
      s.add_dependency(%q<builder>.freeze, [">= 2.1.2"])
      s.add_dependency(%q<erubis>.freeze, ["~> 2.7"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.39.0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<gssapi>.freeze, ["~> 1.2"])
    s.add_dependency(%q<httpclient>.freeze, [">= 2.2.0.2", "~> 2.2"])
    s.add_dependency(%q<rubyntlm>.freeze, [">= 0.6.1", "~> 0.6.0"])
    s.add_dependency(%q<logging>.freeze, ["< 3.0", ">= 1.6.1"])
    s.add_dependency(%q<nori>.freeze, ["~> 2.0"])
    s.add_dependency(%q<gyoku>.freeze, ["~> 1.0"])
    s.add_dependency(%q<builder>.freeze, [">= 2.1.2"])
    s.add_dependency(%q<erubis>.freeze, ["~> 2.7"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.3"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.39.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
  end
end
