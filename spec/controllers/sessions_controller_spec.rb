require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    let(:user) { create(:user, :password => 'secret') }

    it "logs user in and sends them to the home page when successful" do
      post 'create', :email => user.email, :password => 'secret'
      response.should redirect_to root_url
      flash[:notice].should_not be_nil
      cookies[:auth_token].should == user.auth_token
    end

    it 're-renders the login form and notifies user when login fails' do
      post 'create', :email => user.email, :password => 'wrong'
      response.should be_success
      response.should render_template("new")
      flash[:alert].should_not be_nil
      cookies[:auth_token].should be_nil
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      session[:user_id] = 23434
      delete 'destroy'
      cookies[:auth_token].should be_nil
      response.should redirect_to root_url
      flash[:notice].should_not be_nil
    end
  end
end
