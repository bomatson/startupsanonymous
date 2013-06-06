class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :anonymous
  has_secure_password
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validates_presence_of :schedule

  before_create { generate_token(:auth_token)}

  has_one :schedule
  has_many :timeslots, through: :schedule

  before_validation :build_my_schedule, :on => :create
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  #run rake task to create passwords and auth tokens for existing users
  #find path to reset passwords for existing users
  #index auth token
  
  private

  def build_my_schedule
    build_schedule
  end
end
