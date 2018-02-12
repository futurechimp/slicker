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
  gem.name = "slicker"
  gem.homepage = "http://github.com/futurechimp/slicker"
  gem.license = "MIT"
  gem.summary = %Q{Params sanitization for your Ruby application}
  gem.description = %Q{It's raining XSS out there. Protect yourself with Slicker!}
  gem.email = "dave.hrycyszyn@headlondon.com"
  gem.authors = ["Dave Hrycyszyn"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.warning = false
end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
