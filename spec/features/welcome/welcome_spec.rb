require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "as a visitor" do
    it "can show welcome page" do

      visit '/'

      expect(page).to have_content("Welcome")

    end
  end
end
