require 'bundler/setup'
require 'rspec/core/rake_task'

Dir.chdir(File.expand_path('../', __FILE__))
Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)
task :default => [:spec]
