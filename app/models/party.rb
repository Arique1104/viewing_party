class Party < ApplicationRecord
  belongs_to :user
  has_many :party_participants, dependent: :destroy
  has_many :users, through: :party_participants

  validates :user, presence: true
  validates :movie_id, presence: true
  validates :runtime, presence: true
  validates :start_time, presence: true
end
