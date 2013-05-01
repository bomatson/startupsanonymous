class SchedulesController < ApplicationController

  def new
    # @user = User.find(params[:id])
    @user = User.first
    @schedule = Schedule.new(:user_id => @user.id)
    @schedule.timeslots.build
  end

  def create
    @schedule = Schedule.new(params[:schedule])
    if @schedule.save
      flash[:notice] = "Schedule created."
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = "You failed, give up."
      redirect_to new_schedule_path
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
end