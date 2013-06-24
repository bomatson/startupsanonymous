class UserMailer < ActionMailer::Base
  default from: "bobby.matson@gmail.com"

  def confirm(user)
    mail(to: user.email, subject: 'Welcome')
  end

  def password_reset(user)
    @user = user
    mail(to: user.email, subject: 'Password Reset')
  end

  def listener_connection(entrepreneur, listener, timeslot)
    @entrepreneur = entrepreneur
    @listener = listener
    @timeslot = timeslot
    mail(to: entrepreneur.email, subject: 'Connected to a Listener')
  end

  def entrepreneur_connection(listener, entrepreneur, timeslot)
    @listener = listener
    @entrepreneur = entrepreneur
    @timeslot = timeslot
    mail(to: listener.email, subject: 'Connected with Someone in Need')
  end
end
