# encoding: utf-8
# copyright: 2017, Docker, Inc

title 'Universal Control Plane'

val_ucp_uri = attribute('ucpuri', description: 'UCP URI')
val_username = attribute('username', description: 'UCP username')
val_password = attribute('password', description: 'UCP password')

describe ucp({"ucp_uri" => val_ucp_uri, "username" => val_username, "password" => val_password}) do
  its('version') { should eq('2.2.0') }
end

ldap_enabled = ucp({"ucp_uri" => val_ucp_uri, "username" => val_username, "password" => val_password}).ldap_enabled?

control 'AC-2' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 Account Management: LDAP should be enabled and configured to help the
    organization meet the requirements of this control
  '
  describe ldap_enabled do
    it { should be true }
  end
end

control 'AC-2 (1)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (1) Automated System Account Management: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ldap_enabled do
    it { should be true }
  end
end

control 'AC-2 (2)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (2) Removal of Temporary/Emergency Accounts: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ldap_enabled do
    it { should be true }
  end
end

control 'AC-2 (3)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (3) Disable Inactive Accounts: LDAP should be enabled and
    configured to help the organization meet the requirements of this control
  '
  describe ldap_enabled do
    it { should be true }
  end
end
