namespace :print do
  desc 'Print build version'
  task :version do
    build_number = if !ENV['BUILD_NUMBER'].nil?
                     ENV['BUILD_NUMBER']
                   else
                     'dev'
                   end
    version = `agvtool what-marketing-version -terse | cut -f2 -d'='`.chomp
    $stdout.puts "#{version}-#{build_number}"
  end
end