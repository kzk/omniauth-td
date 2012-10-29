#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rubygems'
require 'bundler'
Bundler.setup
$LOAD_PATH << File.dirname(__FILE__) + '/lib'

desc 'start a development server'
task :server do
  Dir.chdir 'examples'
  if which('shotgun')
    exec 'shotgun -O sinatra.rb -p 5678'
  else
    warn 'warn: shotgun not installed; reloading is disabled.'
      exec 'ruby -rubygems sinatra.rb -p 5678'
  end
end
def which(command)
  ENV['PATH'].
    split(':').
    map  { |p| "#{p}/#{command}" }.
    find { |p| File.executable?(p) }
end
task :start => :server
