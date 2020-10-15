require "rails_helper"

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :user}
    it { should validate_presence_of :movie_title}
    it { should validate_presence_of :runtime}
    it { should validate_presence_of :start_time}
  end

  describe "relationships" do
    it { should belong_to :user}
    it {should have_many :party_participants}
    it {should have_many(:users).through(:party_participants)}
  end
end
