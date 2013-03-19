class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.confirm(@user).deliver
        format.html { redirect_to root_path, notice: 'Welcome' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { redirect_to root_path, notice: 'Sorry, we were unable to sign you up' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end