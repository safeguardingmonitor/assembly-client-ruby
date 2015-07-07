require "bundler/gem_tasks"

namespace :client do
  task :copy_schema do
    src_schema_path = File.join(__dir__, '../platform/docs/schema/schema.json')
    dest_schema_path = File.join(__dir__, 'lib/assembly/schema.json')
    raise "Source schema is missing from: #{src_schema_path}" unless File.exists?(src_schema_path)
    FileUtils.cp(src_schema_path, dest_schema_path)
  end

  task :update => :copy_schema do
    schema_path = File.join(__dir__, 'lib/assembly/schema.json')
    client_path = File.join(__dir__, 'lib/assembly/client.rb')
    sh "bundle exec heroics-generate Assembly #{schema_path} http://platform.assembly.education > #{client_path}"
  end
end
