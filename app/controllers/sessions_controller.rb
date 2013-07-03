class SessionsController < ApplicationController
  skip_before_filter :record_page
  skip_before_filter :authentication_required

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      if user.role == 'entrepreneur'
        redirect_to timeslots_path, notice: "Logged in!"
      else
        redirect_to schedule_path, notice: "Logged in, Listener!"
      end 
    else
      flash.now[:error] = "Invalid, my friend! Try again"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "See you next time!"
  end
end
