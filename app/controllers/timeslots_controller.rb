class TimeslotsController < ApplicationController
  before_filter :load_schedule
  before_filter :load_timeslot, :only => [:edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @timeslot = @schedule.timeslots.new
  end

  def create
    @timeslot = @schedule.timeslots.new(params[:timeslot])
    if (@timeslot.save)
      flash.notice = 'New timeslot created! Hell yeah!'
      redirect_to schedule_path
    else
      flash.now[:error] = 'There was a problem saving your timeslot, please try again'
      render 'new'
    end
  end

  def edit
  end    

  def update
    @listener = @timeslot.schedule.user

    @entrepreneur = current_user

    @timeslot.update_attributes(params[:timeslot])  
    if (@timeslot.save)
      if current_user == @listener
        flash.notice = 'Timeslot updated! Booyah!'
        redirect_to schedule_path
      elsif current_user == @entrepreneur
        UserMailer.listener_connection(@entrepreneur, @listener, @timeslot).deliver
        UserMailer.entrepreneur_connection(@listener, @entrepreneur, @timeslot).deliver
        flash.notice = 'Timeslot confirmed! Please check your email'
        redirect_to timeslots_path
      end
    else
      flash.now[:error] = 'There was a problem saving your timeslot, please try again'
      render 'edit'
    end
  end

  def show
    @timeslot = Timeslot.find_by_id(params[:id])
  end

  def index
    @timeslots = Timeslot.all
    @timeslots_by_date = Timeslot.group_by_date()
    @date = params[:date] ? Date.parse(params[:date]) : Date.today   
    @closest = Timeslot.closest.sort.first
  end

  def destroy
    @entrepreneur = User.find_by_id(@timeslot.requester_id)
    @timeslot.destroy
    UserMailer.cancel(@entrepreneur, @timeslot).deliver if @timeslot.confirmed
    flash.notice = 'Timeslot removed :('
    redirect_to schedule_path
  end

  private
  def load_schedule
    @schedule = current_user.schedule
  end

  def load_timeslot
    @timeslot = @schedule.timeslots.find_by_id(params[:id])
  end
end
