# -*- encoding: utf-8 -*-
# stub: kramdown 0.13.8 ruby lib

Gem::Specification.new do |s|
  s.name = "kramdown".freeze
  s.version = "0.13.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Leitner".freeze]
  s.date = "2012-08-31"
  s.description = "kramdown is yet-another-markdown-parser but fast, pure Ruby,\nusing a strict syntax definition and supporting several common extensions.\n".freeze
  s.email = "t_leitner@gmx.at".freeze
  s.executables = ["kramdown".freeze]
  s.files = ["bin/kramdown".freeze]
  s.homepage = "http://kramdown.rubyforge.org".freeze
  s.rdoc_options = ["--main".freeze, "lib/kramdown/document.rb".freeze]
  s.rubyforge_project = "kramdown".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "kramdown is a fast, pure-Ruby Markdown-superset converter.".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<coderay>.freeze, ["~> 1.0.0"])
    else
      s.add_dependency(%q<coderay>.freeze, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<coderay>.freeze, ["~> 1.0.0"])
  end
end
