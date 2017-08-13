# encoding: UTF-8
require 'pathname'

describe WinRM::FS::FileManager do
  let(:dest_dir) { File.join(subject.temp_dir, "winrm_#{rand(2**16)}") }
  let(:temp_upload_dir) { '$env:TEMP/winrm-upload' }
  let(:spec_dir) { File.expand_path(File.dirname(File.dirname(__FILE__))) }
  let(:this_file) { Pathname.new(__FILE__) }
  let(:service) { winrm_connection }

  subject { WinRM::FS::FileManager.new(service) }

  before(:each) do
    expect(subject.delete(dest_dir)).to be true
    expect(subject.delete(temp_upload_dir)).to be true
  end

  context 'exists?' do
    it 'should exist' do
      expect(subject.exists?('c:/windows')).to be true
      expect(subject.exists?('c:/foobar')).to be false
    end
  end

  context 'create and delete dir' do
    it 'should create the directory recursively' do
      subdir = File.join(dest_dir, 'subdir1', 'subdir2')
      expect(subject.create_dir(subdir)).to be true
      expect(subject.exists?(subdir)).to be true
      expect(subject.create_dir(subdir)).to be true
      expect(subject.delete(subdir)).to be true
      expect(subject.exists?(subdir)).to be false
    end
  end

  context 'temp_dir' do
    it 'should return the remote users temp dir' do
      expect(subject.temp_dir).to match(%r{C:/Users/\S+/AppData/Local/Temp})
    end
  end

  context 'upload file' do
    let(:dest_file) { Pathname.new(File.join(dest_dir, File.basename(this_file))) }

    before(:each) do
      expect(subject.delete(dest_dir)).to be true
    end

    it 'should upload the specified file' do
      subject.upload(this_file, dest_file)
      expect(subject).to have_created(dest_file).with_content(this_file)
    end

    it 'should upload to root of the c: drive' do
      subject.upload(this_file, 'c:/winrmtest.rb')
      expect(subject).to have_created('c:/winrmtest.rb').with_content(this_file)
      subject.delete('c:/winrmtest.rb')
    end

    it 'should upload just filename' do
      subject.upload(this_file, 'winrmtest.rb')
      expect(subject).to have_created('winrmtest.rb').with_content(this_file)
      subject.delete('winrmtest.rb')
    end

    it 'should upload using relative file path' do
      subject.upload('./spec/integration/file_manager_spec.rb', dest_file)
      expect(subject).to have_created(dest_file).with_content(this_file)
    end

    it 'should upload to the specified directory' do
      subject.create_dir(dest_dir)
      subject.upload(this_file, dest_dir)
      expect(subject).to have_created(dest_file).with_content(this_file)
    end

    it 'should treat extensionless target as file if not an existing directory' do
      subject.upload(this_file, dest_dir)
      expect(subject).to have_created(dest_dir).with_content(this_file)
    end

    it 'should create extensionless source under target dir if target dir exists' do
      subject.create_dir(dest_dir)
      src_file = File.expand_path('../../Gemfile', File.dirname(__FILE__))
      subject.upload(src_file, dest_dir)
      expect(subject).to have_created(File.join(dest_dir, 'Gemfile')).with_content(src_file)
    end

    it 'should upload to the specified directory with env var' do
      subject.upload(this_file, '$env:Temp')
      expected_dest_file = File.join(subject.temp_dir, File.basename(this_file))
      expect(subject).to have_created(expected_dest_file).with_content(this_file)
    end

    it 'should upload to Program Files sub dir' do
      subject.create_dir('$env:ProgramFiles/foo')
      subject.upload(this_file, '$env:ProgramFiles/foo')
      expect(subject).to have_created('c:/Program Files/foo/file_manager_spec.rb') \
        .with_content(this_file)
    end

    it 'should upload to the specified nested directory' do
      dest_sub_dir = File.join(dest_dir, 'subdir')
      subject.create_dir(dest_sub_dir)
      dest_sub_dir_file = File.join(dest_sub_dir, File.basename(this_file))
      subject.upload(this_file, dest_sub_dir)
      expect(subject).to have_created(dest_sub_dir_file).with_content(this_file)
    end

    it 'yields progress data' do
      block_called = false
      total_bytes_copied = 0
      total = subject.upload(this_file, dest_file) do \
        |bytes_copied, total_bytes, local_path, remote_path|
        expect(total_bytes).to be > 0
        total_bytes_copied = bytes_copied
        expect(local_path).to eq(this_file.to_s)
        expect(remote_path).to eq(dest_file.to_s)
        block_called = true
      end
      expect(total_bytes_copied).to eq(total)
      expect(block_called).to be true
      expect(total).to be > 0
    end

    it 'should not upload when content matches' do
      subject.upload(this_file, dest_dir)
      bytes_uploaded = subject.upload(this_file, dest_dir)
      expect(bytes_uploaded).to eq 0
    end

    it 'should upload when content differs' do
      matchers_file = File.join(spec_dir, 'matchers.rb')
      subject.upload(matchers_file, dest_file)
      bytes_uploaded = subject.upload(this_file, dest_file)
      expect(bytes_uploaded).to be > 0
    end

    it 'raises WinRMUploadError when a bad source path is specified' do
      expect { subject.upload('c:/some/non-existant/path/foo', dest_file) }.to raise_error
    end
  end

  context 'upload empty file' do
    let(:empty_src_file) { Tempfile.new('empty') }
    let(:dest_file) { File.join(dest_dir, 'emptyfile.txt') }

    it 'creates a new empty file' do
      expect(subject.upload(empty_src_file.path, dest_file)).to be 0
      expect(subject).to have_created(dest_file).with_content('')
    end

    it 'overwrites an existing file' do
      expect(subject.upload(this_file, dest_file)).to be > 0
      expect(subject.upload(empty_src_file.path, dest_file)).to be 0
      expect(subject).to have_created(dest_file).with_content('')
    end
  end

  context 'upload directory' do
    let(:root_dir) { File.expand_path('../../', File.dirname(__FILE__)) }
    let(:winrm_fs_dir) { File.join(root_dir, 'lib/winrm-fs') }
    let(:core_dir) { File.join(root_dir, 'lib/winrm-fs/core') }
    let(:scripts_dir) { File.join(root_dir, 'lib/winrm-fs/scripts') }

    it 'copies the directory contents recursively when directory does not exist' do
      bytes_uploaded = subject.upload(winrm_fs_dir, dest_dir)
      expect(bytes_uploaded).to be > 0

      Dir.glob(winrm_fs_dir + '/**/*.rb').each do |host_file|
        host_file_rel = Pathname.new(host_file).relative_path_from(
          Pathname.new(winrm_fs_dir)
        ).to_s
        remote_file = File.join(dest_dir, host_file_rel)
        expect(subject).to have_created(remote_file).with_content(host_file)
      end
    end

    it 'copies the directory recursively when directory does exist' do
      subject.create_dir(dest_dir)
      bytes_uploaded = subject.upload(winrm_fs_dir, dest_dir)
      expect(bytes_uploaded).to be > 0

      Dir.glob(winrm_fs_dir + '/**/*.rb').each do |host_file|
        host_file_rel = Pathname.new(host_file).relative_path_from(
          Pathname.new(winrm_fs_dir).dirname
        ).to_s
        remote_file = File.join(dest_dir, host_file_rel)
        expect(subject).to have_created(remote_file).with_content(host_file)
      end
    end

    it 'does not copy the directory when content is the same' do
      subject.upload(winrm_fs_dir, dest_dir)
      bytes_uploaded = subject.upload(winrm_fs_dir, dest_dir)
      expect(bytes_uploaded).to eq 0
    end

    it 'unzips the directory when cached content is the same' do
      subject.upload(winrm_fs_dir, dest_dir)
      subject.delete(dest_dir)
      expect(subject.exists?(dest_dir)).to be false
      subject.upload(winrm_fs_dir, dest_dir)
      expect(subject.exists?(dest_dir)).to be true
    end

    it 'unzips multiple directories when cached content is the same for all' do
      subject.create_dir(dest_dir)
      subject.upload([core_dir, scripts_dir], dest_dir)
      subject.delete(dest_dir)
      expect(subject.exists?(dest_dir)).to be false
      subject.create_dir(dest_dir)
      subject.upload([core_dir, scripts_dir], dest_dir)
      expect(subject.exists?(File.join(dest_dir, 'core'))).to be true
      expect(subject.exists?(File.join(dest_dir, 'scripts'))).to be true
    end

    it 'copies the directory when content differs' do
      subject.upload(winrm_fs_dir, dest_dir)
      bytes_uploaded = subject.upload(core_dir, dest_dir)
      expect(bytes_uploaded).to be > 0
    end
  end
end
