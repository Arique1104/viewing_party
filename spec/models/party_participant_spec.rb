require "rails_helper"

RSpec.describe PartyParticipant, type: :model do
  describe "relationships" do
    it { should belong_to :friendship}
    it { should belong_to :party}
  end
end
