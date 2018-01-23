require "spec_helper"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.color = true
  config.tty = true
end
