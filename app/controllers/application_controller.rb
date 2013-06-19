class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  respond_to :html
  before_filter :record_page
  before_filter :authentication_required

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Sorry, you aren't allowed to do that!"
  redirect_to root_url
  end


  private
    def record_page
      session[:last_page] = request.fullpath
    end

    def redirect_back(default_url, options = {})
      redirect_to((session[:last_page] ? session[:last_page] : default_url), options)
    end

    def current_user
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    def authentication_required
      if (!current_user)
        flash.alert = 'You must be logged in to access that page, dum dum'
        redirect_to '/login'
      end
    end
  
  helper_method :current_user
end
