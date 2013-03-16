class PagesController < ApplicationController
  def home
  end

  def about
  end

  def help
  end

  def resources
  end

  def user
  	@user ||= @current_user
	end
end
