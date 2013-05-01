class SchedulesController < ApplicationController
   before_filter :load_user

  def new
    # @user = User.find(params[:id])
    @schedule = Schedule.new(:user_id => @user.id)
    @schedule.timeslots.build
  end

  def create
    @schedule = @user.build_schedule(params[:schedule])
#    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
      flash[:notice] = "Schedule created."
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = "You failed, give up."
      render :action => :new
    end
  end

  def show
    # @schedule = Schedule.find(params[:id])
    @schedule = @user.schedule
  end

  def edit
    @schedule = @user.schedule
  end

  def update
    @schedule = @user.schedule
    @schedule.attributes = params[:schedule]
    if @schedule.save
      flash[:notice] = "Schedule updated."
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = "You failed, give up."
      render :action => :edit
    end
  end


  private
  def load_user
    @user = User.first
  end
end