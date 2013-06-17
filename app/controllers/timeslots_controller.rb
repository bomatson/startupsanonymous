class TimeslotsController < ApplicationController
  before_filter :load_schedule
  before_filter :load_timeslot, :only => [:edit, :update, :destroy]
  # check_authorization

  def new
    @timeslot = @schedule.timeslots.new
  end

  def create
    @timeslot = @schedule.timeslots.new(params[:timeslot])
    if (@timeslot.save)
      flash.notice = 'new timeslot created'
      redirect_to schedule_path
    else
      flash.now.alert = 'there was an error saving your timeslot'
      render 'new'
    end
  end

  def edit
  end    

  def update
    @timeslot.attributes = params[:timeslot]
    if (@timeslot.save)
      flash.notice = 'timeslot updated'
      redirect_to schedule_path
    else
      flash.now.alert = 'there was an error saving your timeslot'
      render 'edit'
    end
  end

  def destroy
    @timeslot.destroy
    flash.notice = 'timeslot destroyed'
    redirect_to schedule_path
  end

  private
  def load_schedule
    @schedule = current_user.schedule
  end

  def load_timeslot
    @timeslot = @schedule.timeslots.find(params[:id])
  end
end
