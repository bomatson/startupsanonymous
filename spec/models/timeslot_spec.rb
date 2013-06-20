require 'spec_helper'

describe Timeslot do
  subject{timeslot}
  let(:timeslot){create(:timeslot)}
  let(:invalid_timeslot){
    g = build(:timeslot, start_time: '')
    g.save(validate: false)
    g
  }

  context 'when validates a start time presence' do
    it {invalid_timeslot.should_not be_valid}
  end

  context 'when validates a default for confirmed' do
    it{should be_valid}
  end

  context 'when initializing booking is false' do
    it {timeslot.confirmed.should be_false}
  end

end
