class UsersController < ApplicationController
  skip_before_filter :authentication_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      UserMailer.confirm(@user).deliver
      redirect_to timeslots_path, notice: 'Please check your email'
    else
      redirect_to root_path, error: 'Sorry, we were unable to sign you up. Please do try again!'
    end
  end

  def show 
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user, notice: "Yay! Profile updated"
    else
      flash[:error] = "There was a problem updating your profile"
    render 'edit'
    end
  end

end