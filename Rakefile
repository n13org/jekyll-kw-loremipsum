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

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
