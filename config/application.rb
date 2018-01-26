require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Domus
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller

    config.action_controller.action_on_unpermitted_parameters = :raise
    config.load_defaults 5.1
    config.generators.system_tests = nil

    config.generators do |generate|
      generate.helper false
      generate.javascript_angine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
  end
end
