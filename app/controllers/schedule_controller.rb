class ScheduleController < ApplicationController
  def show
    @schedule = current_user.schedule
    @timeslots_by_date = Timeslot.group_by_date(@schedule.timeslots)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today   

#one persons schedule

  end

  def edit
    @schedule = current_user.schedule
  end

  # @schedule = current_user.schedule.update(params[:schedule])
  # fat model, skinny controller (find blog post Jamis Buck)
  # ask Andrew why DJ instead of Resque

  def update
    @schedule = current_user.schedule
    @schedule.attributes = params[:schedule]

    if @schedule.save
      flash[:notice] = "Schedule updated."
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = "Oh shoot, there was a problem updating your schedule. Please try again"
      render action: :edit
    end

  end
end