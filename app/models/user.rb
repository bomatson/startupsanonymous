class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation, :anonymous, :role, :skype
  has_secure_password
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  validates_presence_of :schedule

  before_create { generate_token(:auth_token)}
  after_create :default_role

  has_one :schedule
  has_many :timeslots, through: :schedule

  before_validation :build_my_schedule, :on => :create

  ROLES = %w[entrepreneur listener admin]


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
  
  def is?(role)
    ROLES.include?(role.to_s)
  end

  def anonymous_check
    if self.anonymous? 
      "Anonymous"
    else
      self.email 
    end
  end

  #run rake task to create passwords and auth tokens for existing users
  #find path to reset passwords for existing users
  #index auth token
  
  private

  def build_my_schedule
    build_schedule
  end

  def default_role
    self.role = "entrepreneur"
    self.save
  end
end
