# encoding: UTF-8
require 'rspec/expectations'

RSpec::Matchers.define :have_created do |remote_file|
  match do |file_manager|
    if @expected_content
      downloaded_file = Tempfile.new('downloaded')
      downloaded_file.close

      subject.download(remote_file, downloaded_file.path)
      @actual_content = File.read(downloaded_file.path)
      downloaded_file.delete

      file_manager.exists?(remote_file) && \
        @actual_content == @expected_content
    else
      file_manager.exists?(remote_file)
    end
  end
  chain :with_content do |expected_content|
    expected_content = File.read(expected_content) if File.file?(expected_content)
    @expected_content = expected_content
  end
  failure_message do
    if @expected_content
      <<-EOH
Expected file '#{remote_file}' to exist with content:

#{@expected_content}

but instead got content:

#{@actual_content}
      EOH
    else
      "Expected file '#{remote_file}' to exist"
    end
  end
end

RSpec::Matchers.define :contain_zip_entries do |zip_entries|
  match do |temp_zip_file|
    zip_entries = [zip_entries] if zip_entries.is_a? String
    @zip_file = Zip::File.open(temp_zip_file.path)
    @missing_entries = []
    zip_entries.each do |entry|
      @missing_entries << entry unless @zip_file.find_entry(entry)
    end
    @missing_entries.empty?
  end
  failure_message do |temp_zip_file|
    msg = "Expected #{temp_zip_file.path} to contain zip entries: #{@missing_entries}\n Got: "
    @zip_file.each do |entry|
      msg << entry.name << ', '
    end
    msg
  end
end
