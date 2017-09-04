namespace :lint do
  desc "Format the code using clang-format"
  task :format_code do
    #Configure to skip Pod|Framework folders
    command = 'find \( -name "*.h" -o -name "*.m" \) -exec clang-format -style=file -i {} \;'
    sh command
  end

  desc "Format only files changed since the last commit"
  task :format_dirt_files do
    commands = ['git diff --diff-filter=ACMRTUXB --name-only', 'git diff --diff-filter=ACMRTUXB --cached --name-only']

    commands.each do |cmd|
      changed_files = %x(#{cmd})
      file_to_format = changed_files.split(/\n/).select do |file|
        ['h','m'].include?(file[-1])
      end

      file_to_format.each do |file|
        format_command = "clang-format -style=file -i \"#{file}\""
        sh format_command
      end
    end
  end

  desc "Lint Swift code using Swiftlint"
  task :swiftlint do
    command = 'swiftlint version; swiftlint autocorrect'
    sh command
  end
end
