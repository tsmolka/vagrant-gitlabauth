source "https://rubygems.org"

VAGRANT_REF = ENV['VAGRANT_VERSION'] || 'master'

group :development do
  gem "vagrant", git: "https://github.com/mitchellh/vagrant.git", ref: VAGRANT_REF
end

group :plugins do
  gemspec  
end
