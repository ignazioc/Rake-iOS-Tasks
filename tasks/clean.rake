require 'fileutils'

namespace :clean do
  
  desc "Clean up the DerivedData directory"
	task :clean_derived_data do
		FileUtils.rm_rf File.join(ENV["HOME"], "Library/Developer/Xcode/DerivedData")
	end
end