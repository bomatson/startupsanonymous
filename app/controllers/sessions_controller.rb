class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user_id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid, my friend! Try again"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "See you next time!"
  end
end
