require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TbmdWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Timezone
    off_set = Time.now.gmt_offset
    config.time_zone = ActiveSupport::TimeZone[off_set]
    config.active_record.default_timezone = :local

    I18n.available_locales = [:en]
    config.i18n.default_locale = :en

    Redis.exists_returns_integer = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
