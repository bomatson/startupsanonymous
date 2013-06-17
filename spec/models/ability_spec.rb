require 'spec_helper'
require "cancan/matchers"

describe "User" do
  describe 'abilities' do

    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ nil }
    let(:timeslot){create(:timeslot, schedule: user.schedule)}

    context "where listener can update timeslots" do
      let(:user){ create(:listener) } 
      #this is still not passing

      it{ should be_able_to(:update, timeslot) }
    end

    context "where entrepreneur cannot update timeslots" do
      let(:user){ create(:entrepreneur) }

      it{ 
        should_not be_able_to(:update, timeslot) }
    end
  end
end