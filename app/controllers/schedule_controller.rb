class ScheduleController < ApplicationController
  # def new
  #   # @user = User.find(params[:id])
  #   @schedule = Schedule.new(:user_id => @user.id)
  #   @schedule.timeslots.build
  # end

#   def create
#     @schedule = @user.build_schedule(params[:schedule])
# #    @schedule = Schedule.new(params[:schedule])
#     if @schedule.save
#       flash[:notice] = "Schedule created."
#       redirect_to schedule_path(@schedule)
#     else
#       flash[:error] = "You failed, give up."
#       render :action => :new
#     end
#   end

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
      render :action => :edit
    end
  end
end