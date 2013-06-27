module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    if params[:auth_token]
        cookies.permanent[:auth_token] = user.auth_token
    else
        cookies[:auth_token] = user.auth_token
    end
    current_user = user                      
  end
end
