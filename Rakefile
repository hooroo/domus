require_relative "config/application"

Rails.application.load_tasks

task :default do
  system("rspec")
  system("rubocop -S")
end
