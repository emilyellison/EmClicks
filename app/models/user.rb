class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  validates :first, presence: true
  validates :last, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
