require 'spec_helper'

describe TimeslotsController do
  let(:user){ create(:user)}

  before {sign_in(user)}

  describe "PUT #update" do
    context 'when listener is editing a time' do
      example do
        timeslot = create(:timeslot, schedule: user.schedule)
        user.role == "listener"
        put :update, id: timeslot.id, timeslot: {end_time: DateTime.now}
        response.should redirect_to schedule_path
      end
    end

    context 'when an entrepreneur is confirming a timeslot' do
      example do
        timeslot = create(:timeslot)
        put :update, id: timeslot.id, timeslot: {confirmed: true}
        response.should redirect_to timeslots_path
      end
    end
  end
end
