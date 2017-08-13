$: << File.dirname(__FILE__) + '/../../lib/'
require 'gssapi'

describe GSSAPI::LibGSSAPI::UnManagedGssBufferDesc, 'Unmanaged Buffer Test' do
  it 'should create a new UnManagedGssBufferDesc and assign to it and test GC' do
    0.upto 100 do |i|
      b = GSSAPI::LibGSSAPI::UnManagedGssBufferDesc.new
      GC.start
      b.value = 'asdf'
    end

    # If we get here without any errors we should be golden
    true.should be_true
  end
end
