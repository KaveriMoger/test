class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  belongs_to :role
  require 'bcrypt'

  # has_secure_password validations: false
  attr_accessor :password
  before_save :encrypt_password
  before_create { generate_token(:auth_token) }
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  #validates :password_confirmation, presence: true, if: :password_digest_changed?

  def authenticate(password)
    if self && self.password_hash == BCrypt::Engine.hash_secret(password, self.password_salt)
      self
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("email like ?", "%#{search}%")
  end
end

