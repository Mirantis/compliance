# encoding: utf-8
# copyright: 2017, Docker, Inc

title 'Universal Control Plane'

val_ucp_uri = attribute('ucpuri', description: 'UCP URI')
val_username = attribute('username', description: 'UCP username')
val_password = attribute('password', description: 'UCP password')
val_client_bundle_host = attribute('clientbundlehost', description: 'UCP client bundle host')
val_client_bundle_ca_cert = attribute('clientbundlecacert', description: 'Path to UCP client bundle CA cert')
val_client_bundle_cert = attribute('clientbundlecert', description: 'Path to UCP client bundle cert')
val_client_bundle_key = attribute('clientbundlekey', description: 'Path to UCp client bundle key')

ucp_instance = ucp({
  "ucp_uri" => val_ucp_uri,
  "username" => val_username,
  "password" => val_password,
  "client_bundle_host" => val_client_bundle_host,
  "client_bundle_ca_cert" => val_client_bundle_ca_cert,
  "client_bundle_cert" => val_client_bundle_cert,
  "client_bundle_key" => val_client_bundle_key
})

describe ucp_instance do
  its('version') { should eq('2.2.0') }
end

control 'AC-2' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 Account Management: LDAP should be enabled and configured to help the
    organization meet the requirements of this control
  '
  describe ucp_instance do
    its('ldap_enabled?') { should be true }
  end
end

control 'AC-2 (1)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (1) Automated System Account Management: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ucp_instance do
    its('ldap_enabled?') { should be true }
  end
end

control 'AC-2 (2)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (2) Removal of Temporary/Emergency Accounts: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ucp_instance do
    its('ldap_enabled?') { should be true }
  end
end

control 'AC-2 (3)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (3) Disable Inactive Accounts: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ucp_instance do
    its('ldap_enabled?') { should be true }
  end
end

control 'AC-2 (4)' do
  impact 1.0
  title 'Send logs to a remote logging server'
  desc '
    AC-2 (4) Automated Audit Actions: UCP should be configured to send its logs
    to a remote logging server
  '
  describe ucp_instance do
    its('remote_logging_enabled?') { should be true }
  end
end
