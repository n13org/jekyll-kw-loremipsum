# frozen_string_literal: true

require 'bundler/gem_tasks'

task default: [:test]

def name
  Jekyll::KargWare::LoremIpsum::RUBYGEM_NAME
end

def version
  Jekyll::KargWare::LoremIpsum::VERSION
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |cop|
  cop.options = ['--display-cop-names']
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

# https://ruby.github.io/rake/doc/rakefile_rdoc.html#label-Comments
# Execute bash commands from a Rakefile https://stackoverflow.com/a/14360488/10655742
desc "Run all appraisal-jobs (Generate, Install and Run tests with versions)"
task :appraisaljobs do
  puts 'Run all appraisal-jobs (Run test with versions)'
  sh "bundle exec appraisal generate"
  sh "bundle exec appraisal install"
  sh "bundle exec appraisal rake rubocop"
  sh "bundle exec appraisal rake test"
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |cop|
  cop.options = ['--display-cop-names']
  cop.formatters = ['progress', 'offenses']
  # https://www.rubydoc.info/gems/rubocop/RuboCop/RakeTask#options-instance_method
  # cop.options = ['--display-cop-names', '-o rubocop.html', '-o rubocop.md']
  # cop.formatters = ['html', 'markdown']
    #--format html -o rubocop.html
    # rubocop --display-cop-names --format markdown -o rubocop.md --format html -o rubocop.html --format progress --format offenses
end
