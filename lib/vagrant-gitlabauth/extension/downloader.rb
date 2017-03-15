require 'uri'
require 'vagrant/util/downloader'

GitLabAuth = VagrantPlugins::GitLabAuth

module Vagrant
  module Util
    class Downloader      
      def gitlabauth_initialize(source, destination, options=nil)
        original_initialize(source, destination, options)
        
        begin
          url = URI.parse(@source)
          if url.scheme =~ /gitlabs?/
            raise GitLabAuth::Errors::MissingCredentialsError unless ENV.key?'PRIVATE_TOKEN'
            
            @headers ||= []
            @headers += ["PRIVATE-TOKEN:#{ENV['PRIVATE_TOKEN']}"]
            
            url.scheme = url.scheme.sub('gitlab', 'http')
            @source = url.to_s
          end
        rescue URI::InvalidURIError
          # Ignore, since its clearly not HTTP
        end
      end
      
      alias original_initialize initialize
      alias initialize gitlabauth_initialize
    end
  end
end
