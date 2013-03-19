class UsersController < ApplicationController
  def create
    @user = User.new params[:user]

    if @user.save
      UserMailer.confirm(@user).deliver
      redirect_to root_path, notice: 'Welcome'
    else
      redirect_to root_path, notice: 'Sorry, we were unable to sign you up'
    end
  end
end