class Schedule < ActiveRecord::Base
  attr_accessible :user_id, :timeslots_attributes
  
  has_many :timeslots
  belongs_to :user

  accepts_nested_attributes_for :timeslots
end
