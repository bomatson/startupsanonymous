FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'password'
  end

  factory :listener, parent: :user do |f|
    after(:create) {|u| 
      u.role = "listener"
      u.save!
    }
  end

  factory :entrepreneur, parent: :user do |f|
    after(:create) {|u| 
      u.role = "entrepreneur"
      u.save!
    }
  end
end