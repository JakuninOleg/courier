# -*- encoding: utf-8 -*-
# stub: trestle-auth 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "trestle-auth".freeze
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sam Pohlenz".freeze]
  s.date = "2018-08-27"
  s.email = ["sam@sampohlenz.com".freeze]
  s.homepage = "https://www.trestle.io".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.rubygems_version = "2.7.9".freeze
  s.summary = "Authentication plugin for the Trestle admin framework".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trestle>.freeze, ["~> 0.8"])
      s.add_runtime_dependency(%q<bcrypt>.freeze, ["~> 3.1.7"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<trestle>.freeze, ["~> 0.8"])
      s.add_dependency(%q<bcrypt>.freeze, ["~> 3.1.7"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<trestle>.freeze, ["~> 0.8"])
    s.add_dependency(%q<bcrypt>.freeze, ["~> 3.1.7"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
