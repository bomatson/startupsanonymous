class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :anonymous
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_presence_of :password, on: :create

  has_one :schedule
  has_many :timeslots, through: :schedule
end
