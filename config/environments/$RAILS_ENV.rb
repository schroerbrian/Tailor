config.action_mailer.delivery_method = :sendmail

config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_options = {from: 'no-reply@example.com'}

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.mail.yahoo.com',
  port:                 465,
  domain:               'example.com',
  user_name:            '<tailorapp>',
  password:             '<Noodle123>',
  authentication:       'plain',
  enable_starttls_auto: true  }