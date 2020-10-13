class Party < ApplicationRecord
  belongs_to :user
  has_many :party_participants
  has_many :friendships, through: :party_participants

  validates_presence_of :user
  validates_presence_of :movie_id
  validates_presence_of :runtime
  validates_presence_of :start
end
