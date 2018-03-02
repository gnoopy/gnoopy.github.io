# -*- encoding: utf-8 -*-
# stub: posix-spawn 0.3.6 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "posix-spawn".freeze
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Tomayko".freeze, "Aman Gupta".freeze]
  s.date = "2011-04-19"
  s.description = "posix-spawn uses posix_spawnp(2) for faster process spawning".freeze
  s.email = ["r@tomayko.com".freeze, "aman@tmm1.net".freeze]
  s.executables = ["posix-spawn-benchmark".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.extra_rdoc_files = ["COPYING".freeze, "HACKING".freeze]
  s.files = ["COPYING".freeze, "HACKING".freeze, "bin/posix-spawn-benchmark".freeze, "ext/extconf.rb".freeze]
  s.homepage = "http://github.com/rtomayko/posix-spawn".freeze
  s.rubygems_version = "2.6.14".freeze
  s.summary = "posix_spawnp(2) for ruby".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>.freeze, ["= 0.7.6"])
    else
      s.add_dependency(%q<rake-compiler>.freeze, ["= 0.7.6"])
    end
  else
    s.add_dependency(%q<rake-compiler>.freeze, ["= 0.7.6"])
  end
end
