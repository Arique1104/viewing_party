class User < ApplicationRecord
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users

  has_secure_password

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } #Must be a valid email
  validates_confirmation_of :password, require: true
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  # validates :password,
  #   allow_nil: true,
  #   length: { in: Devise.password_length },
  #   format: { with: PASSWORD_FORMAT },
  #   confirmation: true,
  #   on: :update





  # have_many :parties
  # have_many :party_participants, through: :parties
end
