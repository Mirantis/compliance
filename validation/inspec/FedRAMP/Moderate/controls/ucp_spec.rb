# encoding: utf-8
# copyright: 2015, The Authors

title 'Universal Control Plane'

val_ucp_uri = attribute('ucpuri', description: 'UCP URI')
val_username = attribute('username', description: 'UCP username')
val_password = attribute('password', description: 'UCP password')

# you can also use plain tests
describe ucp(val_ucp_uri, val_username, val_password) do
  its('version') { should eq('2.2.0-beta1') }
end

# you add controls here
# control 'tmp-1.0' do                        # A unique ID for this control
#   impact 0.7                                # The criticality, if this control fails.
#   title 'Create /tmp directory'             # A human-readable title
#   desc 'An optional description...'
#   describe file('/tmp') do                  # The actual test
#     it { should be_directory }
#   end
# end
