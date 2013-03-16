class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :initialize_user

  def initialize_user
    @user = User.new
  end
end
