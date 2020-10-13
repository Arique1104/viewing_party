class PartyParticipant < ApplicationRecord
  belongs_to :friendship
  belongs_to :party
end
