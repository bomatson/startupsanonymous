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
    @user = params[:id] ? User.find_by_id(params[:id]) : current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to user_path, notice: "Yay! Profile updated"
    else
      flash[:error] = "There was a problem updating your profile"
    render 'edit'
    end
  end

end