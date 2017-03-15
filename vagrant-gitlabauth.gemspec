# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-gitlabauth/version'

Gem::Specification.new do |s|
  s.name = "vagrant-gitlabauth"
  s.version = VagrantPlugins::GitLabAuth::VERSION
  s.authors = ["Tobias", "et al"]
  s.email = ["tsmolka@gmail.com"]
  s.summary = "Private, versioned Vagrant boxes hosted via LFS in GitLab."
  s.homepage = "https://github.com/tsmolka/vagrant-gitlabauth"
  s.licenses = ["GPL-2.0"]
  
  s.files = `git ls-files -z`.split("\x0")
  s.test_files = s.files.grep(/spec/)
  s.require_paths = ['lib']
  
  s.add_dependency 'i18n'
  
  s.add_development_dependency 'bundler', '~> 1.5'
  s.add_development_dependency 'rake', '< 11.0'  
  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-mocks'
  s.add_development_dependency 'rspec-expectations'
end
