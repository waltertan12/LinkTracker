# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  admin           :boolean          default("false")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_reader :password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  after_initialize :ensure_session_token

  validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, confirmation: true, allow_nil: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  validates :admin, inclusion: { in: [true, false] }
  
  validate  :valid_password, on: :create

  has_many :resources
  has_many :favorites
  has_many :links,    through: :resources

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user if user && user.is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_token
    self.save!
  end

  def generate_token
    SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) if password.length > 7
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def valid_password
    errors.add(:password, "Password must have at least 8 characters") if password_digest.nil?
  end
end
