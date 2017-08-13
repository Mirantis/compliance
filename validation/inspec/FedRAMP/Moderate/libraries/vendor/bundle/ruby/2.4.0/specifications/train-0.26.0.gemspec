# -*- encoding: utf-8 -*-
# stub: train 0.26.0 ruby lib

Gem::Specification.new do |s|
  s.name = "train".freeze
  s.version = "0.26.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dominik Richter".freeze]
  s.date = "2017-08-10"
  s.description = "Transport interface to talk to different backends.".freeze
  s.email = ["dominik.richter@gmail.com".freeze]
  s.homepage = "https://github.com/chef/train/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Transport interface to talk to different backends.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, ["< 3.0", ">= 1.8"])
      s.add_runtime_dependency(%q<mixlib-shellout>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<net-ssh>.freeze, ["< 5.0", ">= 2.9"])
      s.add_runtime_dependency(%q<net-scp>.freeze, ["~> 1.2"])
      s.add_runtime_dependency(%q<winrm>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<docker-api>.freeze, ["~> 1.26"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1"])
    else
      s.add_dependency(%q<json>.freeze, ["< 3.0", ">= 1.8"])
      s.add_dependency(%q<mixlib-shellout>.freeze, ["~> 2.0"])
      s.add_dependency(%q<net-ssh>.freeze, ["< 5.0", ">= 2.9"])
      s.add_dependency(%q<net-scp>.freeze, ["~> 1.2"])
      s.add_dependency(%q<winrm>.freeze, ["~> 2.0"])
      s.add_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
      s.add_dependency(%q<docker-api>.freeze, ["~> 1.26"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<json>.freeze, ["< 3.0", ">= 1.8"])
    s.add_dependency(%q<mixlib-shellout>.freeze, ["~> 2.0"])
    s.add_dependency(%q<net-ssh>.freeze, ["< 5.0", ">= 2.9"])
    s.add_dependency(%q<net-scp>.freeze, ["~> 1.2"])
    s.add_dependency(%q<winrm>.freeze, ["~> 2.0"])
    s.add_dependency(%q<winrm-fs>.freeze, ["~> 1.0"])
    s.add_dependency(%q<docker-api>.freeze, ["~> 1.26"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
  end
end
