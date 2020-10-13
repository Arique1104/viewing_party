require "rails_helper"

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :user}
    it { should validate_presence_of :movie_id}
    it { should validate_presence_of :runtime}
    it { should validate_presence_of :start}
  end

  describe "relationships" do
    it { should belong_to :user}
    it {should have_many :party_participants}
    it {should have_many(:friendships).through(:party_participants)}
  end
end
