# -*- encoding: utf-8 -*-
# stub: maruku 0.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "maruku".freeze
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrea Censi".freeze, "Nathan Weizenbaum".freeze]
  s.autorequire = "maruku".freeze
  s.date = "2012-09-16"
  s.description = "Maruku is a Markdown interpreter in Ruby.\n\tIt features native export to HTML and PDF (via Latex). The\n\toutput is really beautiful!\n\t".freeze
  s.email = "ben@benhollis.net".freeze
  s.executables = ["maruku".freeze, "marutex".freeze]
  s.files = ["bin/maruku".freeze, "bin/marutex".freeze]
  s.homepage = "http://github.com/bhollis/maruku".freeze
  s.licenses = ["GPL-2".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Maruku is a Markdown-superset interpreter written in Ruby.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<syntax>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<syntax>.freeze, ["~> 1.0.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.2"])
    else
      s.add_dependency(%q<syntax>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<syntax>.freeze, ["~> 1.0.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
    end
  else
    s.add_dependency(%q<syntax>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<syntax>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.2"])
  end
end
