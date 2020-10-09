class Friendship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
  has_many :party_participants
  has_many :parties, through: :party_participants
end
