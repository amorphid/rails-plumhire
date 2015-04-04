Rails.application.configure do
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.active_record.migration_error = :page_load
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  config.cache_classes = false
  config.consider_all_requests_local       = true
  config.eager_load = false

  config.action_mailer.default_url_options = { host: ENV["HOST"] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:        ENV["SMTP_ADDRESS"],
    authentication: ENV["SMTP_AUTHENTICATION"],
    password:       ENV["SMTP_PASSWORD"],
    port:           ENV["SMTP_PORT"],
    user_name:      ENV["SMTP_USER_NAME"]
  }
end
