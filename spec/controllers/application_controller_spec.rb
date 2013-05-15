require 'spec_helper'

describe ApplicationController do
  controller do
    skip_before_filter :authentication_required, :only => :new

    def index
      head :ok
    end

    def new
      head :ok
    end
  end

  describe 'requiring authenticated users' do
    it 'redirect to the login page when not logged in' do
      get :new
      response.should be_success
    end

    it 'redirect to the login page when not logged in' do
      get :index
      flash[:alert].should_not be_nil;
      response.should redirect_to '/login'
    end

    it 'should be success when logged in' do
      user = create(:user)
      session[:user_id] = user.id
      get :index
      response.should be_success
    end
  end
end