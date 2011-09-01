# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "gator-as3-robotlegs"
  gem.homepage = "http://github.com/newtriks/gator-as3-robotlegs"
  gem.license = "MIT"
  gem.summary = %Q{Gator Generators for RobotLegs}
  gem.description = %Q{Gator Generators for RobotLegs}
  gem.email = "simon@newtriks.com"
  gem.authors = ["devboy","newtriks"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

ENV["CI_REPORTS"] ||= File.expand_path( File.join( File.dirname(__FILE__), "test", "report" ) )
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :spec => "ci:setup:rspec"

#RSpec::Core::RakeTask.new(:rcov) do |spec|
#  spec.pattern = 'spec/**/*_spec.rb'
#  spec.rcov = true
#end

task :test => :spec
task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gator-as3-robotlegs #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
