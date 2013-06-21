module AuthHelper
  def sign_in(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    find("#login").click
    # sign in when not using Capybara.
    cookies[:auth_token] = user.auth_token
  end
end
 
module AuthRequestHelper
  #
  # pass the @env along with your request, eg:
  #
  # GET '/labels', {}, @env
  #
  def http_login
    @env ||= {}
    user = 'username'
    pw = 'password'
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end
 
