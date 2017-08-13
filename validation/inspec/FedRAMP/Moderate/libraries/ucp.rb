require 'http'
require 'json'
require 'uri'
require 'inspec'

class UCP < Inspec.resource(1)
  name 'ucp'

  desc '
    Universal Control Plane (UCP) API resource
  '

  example "
    describe ucp('https://ucp_uri', 'username', 'password') do
      its('version') { should eq ('2.2.0') }
    end
  "

  def initialize(ucp_uri, username, password)
    @ucp_uri = ucp_uri.to_s.chomp('/')
    @username = username.to_s
    @password = password.to_s
    if ucp_uri !~ URI.regexp
      return skip_resource "Invalid UCP URL #{@ucp_uri}"
    end
    @ctx = OpenSSL::SSL::SSLContext.new
    @ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
    begin
      @auth_response = HTTP.post("#{@ucp_uri}/auth/login", :json => { :username => "#{@username}", :password => "#{@password}" }, :ssl_context => @ctx)
    rescue StandardError
      return skip_resource "Error getting auth token from UCP URI #{@ucp_uri}: #{$!}"
    end
    @auth_response_json = JSON.parse(@auth_response)
    @auth_token = @auth_response_json['auth_token']
  end

  def version
    api_response = query_api('version')
    return api_response['Version'].to_s.partition('ucp/').last
  end

  private

  def query_api(endpoint)
    return JSON.parse(HTTP.auth("Bearer #{@auth_token}").get("#{@ucp_uri}/#{endpoint}", :ssl_context => @ctx))
  end
end