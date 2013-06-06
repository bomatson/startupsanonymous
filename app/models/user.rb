class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :anonymous
  has_secure_password
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validates_presence_of :schedule

  before_create { generate_token(:auth_token)}

  has_one :schedule
  has_many :timeslots, through: :schedule

  before_validation :build_my_schedule, :on => :create

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  #build rake task to create passwords and auth tokens for existing users

  private

  def build_my_schedule
    build_schedule
  end
end
