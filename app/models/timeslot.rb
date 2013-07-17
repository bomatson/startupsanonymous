class Timeslot < ActiveRecord::Base
  attr_accessible :confirmed, :start_time, :end_time, :requester_id

  belongs_to :schedule

  validates :start_time, presence: true

  scope :available, where("confirmed != ?", true)
  scope :closest, available.where("start_time >= ?", DateTime.now)
  scope :past, where("start_time < ?", DateTime.now)

#check it for google cal
#http://blog.baugues.com/google-calendar-api-oauth2-and-ruby-on-rails
#check it for creating your own recourring events, try ice cube gem
#http://www.youtube.com/watch?v=F6t-USuWPag
#https://gist.github.com/nathancolgate/4998196
#https://github.com/mzararagoza/rails-fullcalendar-icecube

  def self.group_by_date(scope = scoped)
    scope.closest.group_by {|i| i.start_time.to_date}
  end

  def formatted_start_time
    self.start_time.strftime("%B %d %Y %I:%M %p")
  end

  def only_start_time
    self.start_time.strftime("%I:%M %p")
  end

  def requester_email
    id = self.requester_id
    requester = User.find(id).anonymous_check
    requester
  end


end
