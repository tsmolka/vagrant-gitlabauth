require 'vagrant'

module VagrantPlugins
  module GitLabAuth
    module Errors
      class VagrantGitLabAuthError < Vagrant::Errors::VagrantError
        error_namespace('vagrant_gitlabauth.errors')
      end
      
      class MissingCredentialsError < VagrantGitLabAuthError
        error_key(:missing_credentials)
      end
    end
  end
end
