require "rails_helper"

RSpec.describe Friendship, type: :model do
  describe "relationships" do
    it {should have_many :party_participants}
    it {should have_many(:parties).through(:party_participants)}
  end
end
