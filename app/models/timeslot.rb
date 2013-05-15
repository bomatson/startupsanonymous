class Timeslot < ActiveRecord::Base
  attr_accessible :confirmed, :proposed_time

  belongs_to :schedule

  validates :proposed_time, presence: true

  after_initialize :init

    def init
      self.confirmed  ||= false
    end
end