class ScheduleController < ApplicationController
  def show
    @schedule = current_user.schedule
  end

  def edit
    @schedule = current_user.schedule
  end

  def update
    @schedule = current_user.schedule
    @schedule.attributes = params[:schedule]
    if @schedule.save
      flash[:notice] = "Schedule updated."
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = "You failed, give up."
      render action: :edit
    end
  end
end