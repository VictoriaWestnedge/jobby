require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Jobby
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    # Set the available languages in your application
    config.i18n.available_locales = [:en, :es]

    # Set the default language for your application
    config.i18n.default_locale = :en

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_record.async_query_executor = :global_thread_pool

  end
end
