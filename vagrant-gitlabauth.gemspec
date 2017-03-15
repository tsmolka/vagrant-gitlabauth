# -*- encoding: utf-8 -*-
# stub: vagrant-gitlabauth 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "vagrant-gitlabauth".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tobias".freeze, "et al".freeze]
  s.date = "2017-03-14"
  s.email = ["tsmolka@gmail.com".freeze]
  s.homepage = "https://github.com/tsmolka/vagrant-gitlabauth".freeze
  s.licenses = ["GPL-2.0".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Private, versioned Vagrant boxes hosted via LFS in GitLab.".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
  end
end
