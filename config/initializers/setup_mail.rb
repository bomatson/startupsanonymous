require 'development_mail_interceptor'
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "startupsanonymous@gmail.com",
  :password             => ENV['SMTP_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://startups-anonymous.herokuapp.com/"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?