require 'spec_helper'

describe TimeslotsController do
  let(:user){ create(:user)}

  before {sign_in(user)}

  describe "PUT #update" do
    context 'when editing a time' do
      example do
        timeslot = create(:timeslot, end_time: DateTime.now)
        put :update, end_time: timeslot.end_time
        response.should redirect_to schedule_path
      end
    end

    context 'when confirming a timeslot' do
      example do
        timeslot = create(:timeslot, confirmed: true)
        put :update, id: timeslot.id
        response.should redirect_to timeslots_path
      end
    end
  end
end
