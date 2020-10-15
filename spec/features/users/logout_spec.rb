require "rails_helper"

RSpec.describe "Dashboard Page", type: :feature do
  describe "As a registered user" do
    before :each do
      @twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")

      visit "/"
    end

    it "can logout and return to welcome" do
      fill_in :email, with: @twilight_sparkle.email
      fill_in :password, with: @twilight_sparkle.password
      click_on "Sign In"
      expect(current_path).to eq('/dashboard')

      click_link "Sign Out"
      expect(current_path).to eq('/')
    end
  end
end
