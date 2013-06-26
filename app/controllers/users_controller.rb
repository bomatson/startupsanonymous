class UsersController < ApplicationController
  skip_before_filter :authentication_required

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
      redirect_to root_path, notice: 'Sorry, we were unable to sign you up'
    end
  end

  def show 
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
        sign_in @user
        flash[:success] = "Yay! Profile updated"
        redirect_to @user
    else
    render 'edit'
    end

  end

end