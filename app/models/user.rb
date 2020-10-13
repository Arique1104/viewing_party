class User < ApplicationRecord
  has_many  :followed_users,
            foreign_key: :follower_id,
            class_name: 'Friendship',
            dependent: :destroy
  has_many :followees, through: :followed_users
  has_many  :following_users,
            foreign_key: :followee_id,
            class_name: 'Friendship',
            dependent: :destroy
  has_many :followers, through: :following_users
  has_many :parties, dependent: :destroy
  # have_many :party_participants, through: :parties

  has_secure_password

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, confirmation: true
  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add  :password,
                'Complexity requirement not met.
                Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
