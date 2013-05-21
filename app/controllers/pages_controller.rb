class PagesController < ApplicationController
  skip_before_filter :authentication_required

  def home
    @user = User.new
  end

  def about
  end

  def help
  end

  def resources
  end
end

#put about help resource sin public

#homeController