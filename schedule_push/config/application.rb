require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module SchedulePush
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework   false
      g.integration_tool false
      g.view_specs       false
      g.stylesheets      false
      g.javascripts      false
      g.helper           false
    end
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
      html_tag
    }
  end
end
