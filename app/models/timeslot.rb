class Timeslot < ActiveRecord::Base
  attr_accessible :confirmed, :start_time, :end_time, :requester_id

  belongs_to :schedule

  validates :start_time, presence: true

  scope :available, where("confirmed != ?", true)
  scope :closest, available.where("start_time <= ?", DateTime.now)

  # after_initialize do
  #   self.confirmed  ||= false
  # end

  def self.group_by_date(scope = scoped)
    scope.all.group_by {|i| i.start_time.to_date}
  end

  def formatted_start_time
    self.start_time.strftime("%B %d %Y %I:%M %p")
  end

  def only_start_time
    self.start_time.strftime("%I:%M %p")
  end

end
