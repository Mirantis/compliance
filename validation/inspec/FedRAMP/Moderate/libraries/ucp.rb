require 'net/http'
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
    username = username.to_s
    password = password.to_s
    if ucp_uri !~ URI.regexp
      return skip_resource "Invalid UCP URL #{@ucp_uri}"
    end
    begin
      uri = URI("#{@ucp_uri}/auth/login")
      auth_response = Net::HTTP.post(uri, { "username" => "#{username}", "password" => "#{password}" }.to_json, "Content-Type" => "application/json")
    rescue StandardError
      return skip_resource "Error getting auth token from UCP URI #{@ucp_uri}: #{$!}"
    end
    auth_response_json = JSON.parse(auth_response.body)
    @auth_token = auth_response_json['auth_token']
  end

  def version
    api_response = query_api('version')
    return api_response['Version'].to_s.partition('ucp/').last
  end

  def ldap_enabled?
    api_response = query_api('enzi/v0/config/auth')
    return api_response['backend'] == "ldap" ? true : false
  end

  private

  def query_api(endpoint)
    endpoint_uri = URI.parse("#{@ucp_uri}/#{endpoint}")
    Net::HTTP.start(endpoint_uri.host, endpoint_uri.port, :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
      request = Net::HTTP::Get.new(endpoint_uri)
      request['Authorization'] = "Bearer #{@auth_token}"
      response = http.request(request)
      return JSON.parse(response.body)
    end
  end
end