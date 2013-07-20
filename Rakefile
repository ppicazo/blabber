require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << "test"
  task.verbose = true
end        

desc "Run Blabber Tests"

task :default => :test

###GEM PACKAGING###
require 'rubygems'
require 'rubygems/package_task'
require 'fileutils'

spec = Gem::Specification.load(Dir['*.gemspec'].first)
gem = Gem::PackageTask.new(spec)
gem.define
