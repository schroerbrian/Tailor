# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Taylor::Application.initialize!

#configuration for SendGrid - Heroku
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => ENV['SENDGRID_DOMAIN'],
  :user_name =>  ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :authentication => 'plain',
  :enable_starttls_auto => true
}