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
    it { should be_ldap_enabled }
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
    it { should be_ldap_enabled }
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
    it { should be_ldap_enabled }
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
    it { should be_ldap_enabled }
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
    it { should be_remote_logging_enabled }
  end
end

control 'AC-2 (5)' do
  impact 1.0
  title 'Lifetime of user''s session should not exceed 15 minutes'
  desc '
    AC-2 (5) Inactivity Logout: UCP should be configured such that the maximum
    lifetime of a user''s session does not exceed 15 minutes
  '
  describe ucp_instance do
    its('auth_session_lifetime') { should be <= 15 }
    its('auth_session_renewal_threshold') { should eq 0 }
  end
end

control 'AC-2 (9)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (9) Restrictions on Use of Shared/Group Accounts: LDAP should be
    enabled and configured to help the organization meet the requirements of
    this control
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
  end
end

control 'AC-2 (10)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (10) Shared/Group Account Credential Termination: LDAP should be
    enabled and configured to ensure shared/group account credentials
    synchronized to UCP are terminated when members leave the group.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
  end
end

control 'AC-2 (11)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (11) Usage Conditions: LDAP should be enabled and configured to help
    the organization meet the requirements of this control.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
  end
end

control 'AC-2 (12)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (12) Account Monitoring/Atypical Usage: LDAP and remote logging should
    be enabled and configured to help the organization meet the requirements of
    this control.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
    it { should be_remote_logging_enabled }
  end
end

control 'AC-2 (13)' do
  impact 1.0
  title 'Ensure LDAP integration has been enabled'
  desc '
    AC-2 (13) Disable Accounts for High-Risk Individuals: LDAP integration
    should be enabled and configured to help the organization meet the
    requirements of this control.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
  end
end

control 'AC-6 (9)' do
  impact 1.0
  title 'Send logs to a remote logging server'
  desc '
    AC-6 (9) Auditing Use of Privileged Functions: UCP should be configured to
    send its logs to a remote logging server so that the logs can be audited to
    meet the requirements of this control.
  '
  describe ucp_instance do
    its('remote_logging_enabled?') { should be true }
  end
end

control 'AC-7' do
  impact 1.0
  title 'Enforce unsuccessful logon attempts limits'
  desc '
    AC-7 Unsuccessful Logon Attempts: LDAP integration should be enabled and UCP
    should be configured to limit the allowed number of unsuccessful login
    attempts.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
  end
end

control 'AC-10' do
  impact 1.0
  title 'Enforce concurrent session limits'
  desc '
    AC-10 Concurrent Session Control: LDAP integration should be enabled and UCP
    should be configured to limit the allowed number of concurrent sessions to
    no more than 3.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
    its('auth_per_user_limit') { it should be <= 3 }
  end
end

control 'AC-11' do
  impact 1.0
  title 'Enforce session lock timeout'
  desc '
    AC-11 Session Lock: LDAP integration should be enabled and UCP should be
    configured such that the maximum lifetime of a user''s session does not
    exceed 15 minutes.
  '
  describe ucp_instance do
    it { should be_ldap_enabled }
    its('auth_session_lifetime') { should be <= 15 }
    its('auth_session_renewal_threshold') { should eq 0 }
  end
end

control 'AC-17 (1)' do
  impact 1.0
  title 'Send logs to a remote logging server'
  desc '
    AC-17 (1) Automated Monitoring/Control: UCP should be configured to send its
    logs to a remote logging server so that the logs can be monitored to meet the
    requirements of this control.
  '
  describe ucp_instance do
    its('remote_logging_enabled?') { should be true }
  end
end
