class PasswordResetsController < ApplicationController
  skip_before_filter :authentication_required
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, notice: 'Email sent with password reset instructions!'
  end
end
