class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html
  before_filter :record_page
  before_filter :authentication_required


  private
    def record_page
      session[:last_page] = request.fullpath
    end

    def redirect_back(default_url, options = {})
      redirect_to((session[:last_page] ? session[:last_page] : default_url), options)
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authentication_required
      if (!current_user)
        flash.alert = 'You must be logged in to access that page, dum dum'
        redirect_to '/login'
      end
    end
  
  helper_method :current_user
end
