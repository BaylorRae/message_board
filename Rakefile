# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :board_engine_test do
  sh "cd engines/board && rake"
end

task :default => :board_engine_test

begin
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
  task :test_with_coveralls => [:spec, :cucumber, :board_engine_test, 'coveralls:push']
rescue LoadError
end
