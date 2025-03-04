# -*- encoding: utf-8 -*-
# stub: semantic-ui-sass 2.4.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "semantic-ui-sass".freeze
  s.version = "2.4.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["doabit".freeze]
  s.date = "2018-09-21"
  s.description = "Semantic UI, converted to Sass and ready to drop into Rails, Compass, or Sprockets.".freeze
  s.email = ["doinsist@gmail.com".freeze]
  s.homepage = "http://github.com/doabit/semantic-ui-sass".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.9".freeze
  s.summary = "Semantic UI, converted to Sass and ready to drop into Rails, Compass, or Sprockets.".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<sass>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<sass-rails>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<sprockets-rails>.freeze, [">= 2.1.3"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 3.0"])
      s.add_development_dependency(%q<rails>.freeze, [">= 3.2.0"])
      s.add_development_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<sass>.freeze, [">= 3.2"])
      s.add_dependency(%q<sass-rails>.freeze, [">= 3.2"])
      s.add_dependency(%q<sprockets-rails>.freeze, [">= 2.1.3"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<dotenv>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 3.0"])
      s.add_dependency(%q<rails>.freeze, [">= 3.2.0"])
      s.add_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<sass>.freeze, [">= 3.2"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 3.2"])
    s.add_dependency(%q<sprockets-rails>.freeze, [">= 2.1.3"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 3.0"])
    s.add_dependency(%q<rails>.freeze, [">= 3.2.0"])
    s.add_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
  end
end
