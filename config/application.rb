require_relative 'boot'

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
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WkmChallengeRodrigosggouvea
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Whitelist locales available for the application
    I18n.available_locales = [:en, :pt]

    # Set default locale to something other than :en
    I18n.default_locale = :pt

    config.generators do |g|
      g.view_specs false
      g.helper false
      g.helper_specs false
      g.routing_specs false
      g.fixture false
      g.fixture_specs false
      g.request_specs false
    end
  end
end
