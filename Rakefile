require "bundler/gem_tasks"
require 'rake/testtask'

desc "Run tests"
Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
end

task :default => :test
