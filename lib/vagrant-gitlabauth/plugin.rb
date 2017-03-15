begin
  require 'vagrant'
rescue LoadError
  raise 'The vagrant-gitlabauth plugin must be run within Vagrant.'
end

require_relative 'errors'
#Note: extending downloader is not officially supported, authenticate_box_url hook is preferred
#require_relative 'extension/downloader'

module VagrantPlugins
  module GitLabAuth
    class Plugin < Vagrant.plugin('2')
      name 'gitlabauth'
      description <<-DESC
        Private, versioned Vagrant boxes hosted via LFS in GitLab.
      DESC
      
      action_hook(:gitlab_urls, :authenticate_box_url) do |hook|
        require_relative 'middleware/add_authentication'
        hook.prepend(AddAuthentication)
      end      
    end
  end
end
