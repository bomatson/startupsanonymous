FactoryGirl.define do

  factory :schedule do
    user {|i| i.association(:user)}
  end
end