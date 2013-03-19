require 'spec_helper'

describe UsersController do

  def valid_attributes
    {email: 'text@example.com'}
  end

  def invalid_attributes
    {email: 'not-an-email'}
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new User' do
        expect { post :create, {user: valid_attributes} }.to change(User, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, {user: valid_attributes}
        response.should redirect_to root_path
      end
    end

    describe 'with invalid params' do
      it 'does not create a new User' do
        expect { post :create, {user: invalid_attributes} }.not_to change(User, :count)
      end

      it 'redirects to the home page' do
        post :create, {user: invalid_attributes}
        response.should redirect_to root_path
      end
    end
  end
end