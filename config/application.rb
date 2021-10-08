require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Refile.secret_key = 'dc49a212e1c4efb7e09e86e0ae46b04e78f35ff663e70d7199bac211e0f91d2b61f527d9562dcf07c3693868f8a9780ff7597349e8cc1ff86e69689815431b47'

module Taiwanplace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.time_zone = 'Tokyo'
  end
end
