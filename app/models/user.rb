class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_confirmation_of :password, require: true

  has_secure_password

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users

  # have_many :parties
  # have_many :party_participants, through: :parties
end
