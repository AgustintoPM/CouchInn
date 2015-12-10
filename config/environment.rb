# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
# Turn off auto TLS for e-mail
#ActionMailer::Base.smtp_settings[:enable_starttls_auto] = false

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "https://gentle-spire-4321.herokuapp.com/",
  :authentication => :plain,
  :user_name => "angelicabufartanelo@gmail.com",
  :password => "ingenieria.2015"
}
