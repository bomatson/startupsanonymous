FactoryGirl.define do

  factory :timeslot do
    schedule {|i| i.association(:schedule)}
    start_time DateTime.new
    confirmed false
  end
end