class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :party_participants, dependent: :destroy
  has_many :parties, through: :party_participants
end
