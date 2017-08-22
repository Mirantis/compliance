require 'net/http'
require 'json'
require 'uri'
require 'inspec'
require 'toml'


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

  def initialize(args)
    @ucp_uri = args["ucp_uri"].to_s.chomp('/')
    username = args["username"].to_s
    password = args["password"].to_s
    @client_bundle_docker_host = args["client_bundle_docker_host"].to_s
    @client_bundle_ca_cert_path = args["client_bundle_ca_cert_path"].to_s
    @client_bundle_cert_path = args["client_bundle_cert_path"].to_s
    @client_bundle_key_path = args["client_bundle_key_path"].to_s
    if !@ucp_uri.empty? && @ucp_uri !~ URI.regexp
      return skip_resource "Invalid UCP URL #{@ucp_uri}"
    end
    unless File.file?(@client_bundle_ca_cert_path)
      return skip_resource "Client bundle CA cert path #{@client_bundle_ca_cert_path} does not exist"
    end
    unless File.file?(@client_bundle_cert_path)
      return skip_resource "Client bundle cert path #{@client_bundle_cert_path} does not exist"
    end
    unless File.file?(@client_bundle_key_path)
      return skip_resource "Client bundle key path #{@client_bundle_key_path} does not exist"
    end

    return if @ucp_uri.empty?
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

  def remote_logging_enabled?
    begin
      ucp_config = inspec.command("docker -H #{@client_bundle_docker_host} --tlsverify --tlscacert #{@client_bundle_ca_cert_path} --tlscert #{@client_bundle_cert_path} --tlskey #{@client_bundle_key_path} config inspect --format '{{ printf \"%s\" .Spec.Data }}' com.docker.ucp.config-1").stdout
      ucp_config_parsed = TOML.load(ucp_config)
      return ucp_config_parsed['log_configuration']['host'].empty? ? false : true
    rescue StandardError
      return skip_resource "Error connecting to UCP host #{@client_bundle_docker_host}: #{$!}"
    end
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