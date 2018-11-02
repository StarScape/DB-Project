# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :regen_db do
  print `rm db/development.sqlite3`
  print `rm db/test.sqlite3`
  print `rails db:setup`
  print `rails db:migrate`
  print `rails db:seed`
end