# The User model will authenticate the system users.
#
class User < ActiveRecord::Base
  # Before each save the email address will be downcase to prevent instances of duplicate emails.
  before_save { email.downcase! }

  # Name of the user will be 50 charactes or less and it needs to be present.
  validates :name, presence: true, length: {maximum: 50}

  # Regex will validate email address.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
