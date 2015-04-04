Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.serve_static_files   = true
  config.static_cache_control = 'public, max-age=3600'
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_support.test_order = :random
  config.active_support.deprecation = :stderr

  # Sending email
  config.action_mailer.default_url_options = { host: ENV["HOST"] }
  config.action_mailer.delivery_method = :test
  config.action_mailer.smtp_settings = {
    address:        ENV["SMTP_ADDRESS"],
    authentication: ENV["SMTP_AUTHENTICATION"],
    password:       ENV["SMTP_PASSWORD"],
    port:           ENV["SMTP_PORT"],
    user_name:      ENV["SMTP_USER_NAME"]
  }

end
