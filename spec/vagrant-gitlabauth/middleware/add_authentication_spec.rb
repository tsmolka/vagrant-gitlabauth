require 'spec_helper'

require 'vagrant-gitlabauth/middleware/add_authentication'

describe VagrantPlugins::GitLabAuth::AddAuthentication do

  before(:each) do
    @env = {}
    @app = double 'app', call: true
    @subject = described_class.new(@app, @env)
  end
  
  it 'should check PRIVATE_TOKEN variable' do
    ENV['PRIVATE_TOKEN'] = nil
    @env[:box_urls] = ['gitlab://localhost/']
    expect{@subject.call(@env)}.to raise_error(VagrantPlugins::GitLabAuth::Errors::MissingCredentialsError)
  end

  it 'should handle gitlab://' do
    ENV['PRIVATE_TOKEN'] = 'sample_token'
    @env[:box_urls] = ['gitlab://localhost/', 'gitlabs://localhost/']
    
    expect(@subject.call(@env))
    expect(@app).to have_received :call
    
    expect(@env[:box_urls]).to eq(["http://localhost/?private_token=sample_token", "https://localhost/?private_token=sample_token"])
  end
  
  it 'should ignore http:// and https://' do
    @env[:box_urls] = ['http://localhost/', 'https://localhost/']
    
    expect(@subject.call(@env))
    expect(@app).to have_received :call
    
    expect(@env[:box_urls]).to eq(['http://localhost/', 'https://localhost/'])
  end

end
