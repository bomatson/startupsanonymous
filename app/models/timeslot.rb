class Timeslot < ActiveRecord::Base
  attr_accessible :confirmed, :start_time, :end_time

  belongs_to :schedule

  validates :start_time, presence: true

  after_initialize do
    self.confirmed  ||= false
  end

  def self.group_by_date(scope = scoped)
    scope.all.group_by {|i| i.start_time.to_date}
  end
end
