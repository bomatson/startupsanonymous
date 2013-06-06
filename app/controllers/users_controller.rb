class UsersController < ApplicationController
  skip_before_filter :authentication_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.confirm(@user).deliver
      redirect_to root_path, notice: 'Please check your email'
    else
      redirect_to root_path, notice: 'Sorry, we were unable to sign you up'
    end
  end
end