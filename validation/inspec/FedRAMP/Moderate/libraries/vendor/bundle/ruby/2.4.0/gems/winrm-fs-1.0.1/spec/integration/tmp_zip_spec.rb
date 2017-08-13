# encoding: UTF-8
require_relative '../../lib/winrm-fs/core/tmp_zip'

describe WinRM::FS::Core::TmpZip do
  let(:winrm_fs_dir) { File.expand_path('../../lib/winrm-fs', File.dirname(__FILE__)) }

  subject { WinRM::FS::Core::TmpZip.new(winrm_fs_dir) }

  context 'temp file creation' do
    it 'should create a temp file on disk' do
      path = subject.path
      expect(File.exist?(path)).to be true
      subject.unlink
      expect(File.exist?(path)).to be false
    end
  end

  context 'create zip' do
    it 'should add all files in directory to the zip recursively' do
      expect(subject).to contain_zip_entries([
        'exceptions.rb',
        'core/tmp_zip.rb',
        'scripts/checksum.ps1.erb'])
    end
  end
end
