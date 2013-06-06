class SessionsController < ApplicationController
  skip_before_filter :record_page
  skip_before_filter :authentication_required

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid, my friend! Try again"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "See you next time!"
  end
end
