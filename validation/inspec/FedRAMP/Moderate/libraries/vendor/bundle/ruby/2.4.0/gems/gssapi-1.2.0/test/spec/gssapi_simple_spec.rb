$: << File.dirname(__FILE__) + '/../../lib/'
require 'gssapi'
require 'base64'
require 'yaml'


describe GSSAPI::Simple, 'Test the Simple GSSAPI interface' do

  before :all do
    @conf = YAML.load_file "#{File.dirname(__FILE__)}/conf_file.yaml"
  end

  it 'should get the initial context for a client' do
    gsscli = GSSAPI::Simple.new(@conf[:c_host], @conf[:c_service])
    token = gsscli.init_context
    token.should_not be_empty
  end

  it 'should acquire credentials for a server service' do
    gsscli = GSSAPI::Simple.new(@conf[:s_host], @conf[:s_service], @conf[:keytab])
    gsscli.acquire_credentials.should be_true
  end

end
