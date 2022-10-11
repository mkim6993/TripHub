class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Will return an array of follows for the given user instance
  has_many :follows, foreign_key: :star_id, class_name: "StarFan"
  # Will return an array of users who follow the user instance
  has_many :followers, through: :follows, source: :fan

  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :fan_id, class_name: "StarFan"
  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :star
end