require 'spec_helper'

describe User do
    it { should have_one :schedule } 

    describe 'Validations' do
      it 'is able to be valid' do
        build(:user).should be_valid
      end

      it 'requires a password when being created' do
        build(:user, :password => nil).should have(1).error_on(:password)
        user = User.find(create(:user).id)
        user.password.should be_nil
        user.should be_valid
      end

      it 'requires a valid email' do
        build(:user, :email => 'invalid').should have(1).error_on(:email)
        build(:user, :email => 'inva@lid').should have(1).error_on(:email)
        build(:user, :email => '@invalid.com').should have(1).error_on(:email)
        build(:user, :email => 'foo@inv_alid.commma').should have(1).error_on(:email)
      end

      it 'requires a unique email' do
        user = create(:user)
        build(:user, :email => user.email).should have(1).error_on(:email)
      end

      it 'requires a schedule' do
        user = create(:user)
        user.schedule = nil
        user.should have(1).error_on(:schedule)
      end
    end

    describe 'schedule' do
      it 'is created when a user is created' do
        user = build(:user)
        expect {
          user.save!
          user.reload
        }.to change { user.schedule }.from(nil)
      end

      it 'is not created for an existing user' do
        user = create(:user)
        user.schedule = nil
        expect {
          user.valid?
        }.to_not change { user.schedule }.from(nil)
      end
    end

    describe 'roles' do


      # it 'listener can create timeslots' do
      #   user = create(:user, role: "listener" )
      #   timeslot = create(:timeslot, schedule: user.schedule)
      #   expect {
      #     timeslot.confirmed = true
      #     timeslot.save!
      #   }.to change { user.timeslot.attributes }
      # end

      it 'entrepreneur is the default' do
        create(:user).role.should eq("entrepreneur")    
      end
    end
end
