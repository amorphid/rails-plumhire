Rails.application.configure do
  config.action_mailer.default_url_options = { :host => ENV["HOST"] }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 465,
    domain:               ENV["SMTP_DOMAIN"],
    user_name:            ENV["EMAIL_USERNAME"],
    password:             ENV["EMAIL_PASSWORD"],
    authentication:       "plain",
    enable_starttls_auto: true
  }
end
