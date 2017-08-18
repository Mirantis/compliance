# encoding: utf-8
# copyright: 2015, The Authors

title 'Universal Control Plane'

val_ucp_uri = attribute('ucpuri', description: 'UCP URI')
val_username = attribute('username', description: 'UCP username')
val_password = attribute('password', description: 'UCP password')

# you can also use plain tests
describe ucp(val_ucp_uri, val_username, val_password) do
  its('version') { should eq('2.2.0') }
end

control 'ac-2' do
  impact 0.8
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 Account Management: LDAP should be enabled and configured to help the
    organization meet the requirements of this control
  '
  describe ucp(val_ucp_uri, val_username, val_password) do
    it { should be_ldap_enabled }
  end
end

control 'ac-2 (1)' do
  impact 0.8
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (1) Account Management | Automated System Account Management: LDAP
    should be enabled and configured to help the organization meet the
    requirements of this control
  '
  describe ucp(val_ucp_uri, val_username, val_password) do
    it { should be_ldap_enabled }
  end
end
