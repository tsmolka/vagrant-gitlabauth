require 'cgi'
require 'uri'

require_relative '../errors'

module VagrantPlugins
  module GitLabAuth
    class AddAuthentication
      def initialize(app, env)
        @app = app
      end

      def call(env)
        env[:box_urls].map! do |url|
          u = URI.parse(url)
          if u.scheme =~ /gitlabs?/
            raise Errors::MissingCredentialsError unless ENV.key?'PRIVATE_TOKEN'
            q = CGI.parse(u.query || "")
            q["private_token"] = ENV['PRIVATE_TOKEN']
            u.query = URI.encode_www_form(q)
            u.scheme = u.scheme.sub('gitlab', 'http')
          end          
          u.to_s
        end        
        @app.call(env)
      end
    end
  end
end
