require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:spec) do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end

desc 'Run pry console'
task :console do
  require 'pry'
  require 'transparent_proxy'
  ARGV.clear
  Pry.start
end

task default: :spec