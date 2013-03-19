class UserMailer < ActionMailer::Base
  default from: "bobby.matson@gmail.com"

  def confirm(user)
    mail(to: user.email, subject: 'Welcome')
  end
end
