# -*- encoding: utf-8 -*-
# stub: responders 2.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "responders".freeze
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u00E9 Valim".freeze]
  s.date = "2019-01-21"
  s.description = "A set of Rails responders to dry up your application".freeze
  s.email = "contact@plataformatec.com.br".freeze
  s.homepage = "https://github.com/plataformatec/responders".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "responders".freeze
  s.rubygems_version = "2.7.9".freeze
  s.summary = "A set of Rails responders to dry up your application".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 4.2.0", "< 6.0"])
      s.add_runtime_dependency(%q<actionpack>.freeze, [">= 4.2.0", "< 6.0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 4.2.0", "< 6.0"])
      s.add_dependency(%q<actionpack>.freeze, [">= 4.2.0", "< 6.0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 4.2.0", "< 6.0"])
    s.add_dependency(%q<actionpack>.freeze, [">= 4.2.0", "< 6.0"])
  end
end
