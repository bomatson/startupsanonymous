require 'spec_helper'

describe UsersController do

  def invalid_attributes
    {email: 'not-an-email'}
  end

  describe 'POST create' do

    let(:user) { create(:user, :password => 'secret') }
    
    describe 'with valid params' do
      it 'creates a new User' do
        expect { post :create, email: user.email, password: 'secret' }.
        to change(User, :count).by(1)
      end

    end

    describe 'with invalid params' do
      it 'does not create a new User' do
        expect { post :create, {user: invalid_attributes} }.not_to change(User, :count)
      end

    end
  end


  describe 'PUT update' do

    let(:user) { create(:user, :password => 'secret') }
    
    describe 'with valid params' do
      it 'updates the new skype username' do
      put :update, id: user.id, user: { skype: 'bobby.matson' }
      response.should redirect_to @user
      end
    end

  end
end