class UCP < Inspec.Resource(1)
  name 'ucp'

  desc "
    Universal Control Plane (UCP) API resource
  "

  example "
    describe ucp('https://ucp_url') do
      its('version') { should eq ('1.0') }
    end
  "

  
end