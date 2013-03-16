class UserMailer < ActionMailer::Base
  default from: "bobby.matson@gmail.com"

  def confirm(user)
  	@user = user
  	mail(to: user.email, subject: 'Welcome')

  end
end
