require 'spec_helper'

describe Timeslot do
  it 'validates a proposed time presence' do
    timeslot = Timeslot.new(:confirmed => false)
    timeslot.should_not be_valid
  end

  it 'validates a default for confirmed' do
    timeslot = Timeslot.new(:proposed_time => DateTime.new)
    timeslot.should be_valid
  end
end