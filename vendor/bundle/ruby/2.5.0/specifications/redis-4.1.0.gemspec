# -*- encoding: utf-8 -*-
# stub: redis 4.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "redis".freeze
  s.version = "4.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ezra Zygmuntowicz".freeze, "Taylor Weibley".freeze, "Matthew Clark".freeze, "Brian McKinney".freeze, "Salvatore Sanfilippo".freeze, "Luca Guidi".freeze, "Michel Martens".freeze, "Damian Janowski".freeze, "Pieter Noordhuis".freeze]
  s.date = "2018-12-13"
  s.description = "    A Ruby client that tries to match Redis' API one-to-one, while still\n    providing an idiomatic interface.\n".freeze
  s.email = ["redis-db@googlegroups.com".freeze]
  s.homepage = "https://github.com/redis/redis-rb".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "2.7.9".freeze
  s.summary = "A Ruby client library for Redis".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<test-unit>.freeze, [">= 3.1.5"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_development_dependency(%q<hiredis>.freeze, [">= 0"])
      s.add_development_dependency(%q<em-synchrony>.freeze, [">= 0"])
    else
      s.add_dependency(%q<test-unit>.freeze, [">= 3.1.5"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_dependency(%q<hiredis>.freeze, [">= 0"])
      s.add_dependency(%q<em-synchrony>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<test-unit>.freeze, [">= 3.1.5"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<hiredis>.freeze, [">= 0"])
    s.add_dependency(%q<em-synchrony>.freeze, [">= 0"])
  end
end
