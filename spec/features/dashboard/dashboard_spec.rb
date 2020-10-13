require "rails_helper"

RSpec.describe "Dashboard Page", type: :feature do
  describe "As a registered user" do
    before :each do
      @twilight_sparkle = User.create!(email:"twilight_sparkle@email.com", password:"User@us3r")

      @spike = User.create!(email:"spike@email.com", password:"User@us3r")
      @starlight_glimmer = User.create!(email:"starlight_glimmer@email.com", password:"User@us3r")
      @pinkie_pie = User.create!(email:"pinkie_pie@email.com", password:"User@us3r")

      @rainbow_dash = User.create!(email:"rainbow_dash@email.com", password:"User@us3r")
      binding.pry
      # @rarity = User.create!(email:"rarity@email.com", password:"User@us3r")
      # @applejack = User.create!(email:"applejack@email.com", password:"User@us3r")
      # @fluttershy = User.create!(email:"fluttershy@email.com", password:"User@us3r")




      # @rainbow_dash.followers << [@rarity, @applejack, @twilight_sparkle]
      # @twilight_sparkle.followers << [@spike, @starlight_glimmer]
      # @pinkie_pie.followers << [@rainbow_dash, @twilight_sparkle, @rarity, @applejack, @fluttershy, @spike, @starlight_glimmer]

      # @party_1  = @twilight_sparkle.parties.create!(movie_id:"4", runtime:"12", date:"Oct 12, 1940", start:"12 pm")

      # THIS IS WHERE WE GET STUCK
      # - Do we need to update friendships? (if I friend you, shouldnt it automatically friend me back?)
      # - PartyParticipants and Friendships arent working
      # - This MAY have to be top down so that the features can drive the database
      # - We may have to go back to the idea of an array of participant ids (this seems easier to update in the long run)
      # binding.pry

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@twilight_sparkle)

      visit "/dashboard"
    end

    it "can have a dashboard page" do
      expect(page).to have_content("Welcome #{@twilight_sparkle.name.capitalize}!")
      expect(page).to have_button("Discover Movies")
      within "#friends" do
        expect(page).to have_content("Friends")
      end
      within "#parties" do
        expect(page).to have_content("Viewing Parties")
      end
    end

    it "can route discover movies button to discover page" do
      click_button "Discover Movies"
      expect(current_path).to eq("/discover")
      expect(page).to have_content("Welcome #{@twilight_sparkle.name.capitalize}!")
      # expect(page).to have_content("Discover Show Page") # NEEDS TO BE UPDATED TO A DYNAMIC WELCOME HEADER
    end

    it "can see friends section is empty if no friends are added" do
      within "#friends" do
        expect(page).to have_content("You currently have no friends")
      end
    end

    describe "when a user has friends added" do
      before :each do
        @twilight_sparkle.friendships.create!(friend:@spike)
        @twilight_sparkle.friendships.create!(friend:@starlight_glimmer)
        @rainbow_dash.friendships.create!(friend:@twilight_sparkle)
      end

      it "can see friends section with friends you've added" do
        within "#friends" do
          expect(page).to have_content(@spike.name)
          expect(page).to have_content(@starlight_glimmer.name)
          expect(page).to have_content(@rainbow_dash.name)
          expect(page).to_not have_content(@pinkie_pie.name)
        end
      end

      it "can add a friend" do
        within "#friends" do
          expect(page).to_not have_content(@pinkie_pie.name)
          fill_in :email, with: @pinkie_pie.email
          expect(page).to have_button("Add Friend")
          click_button "Add Friend"
          expect(current_path).to eq('/dashboard')
          expect(page).to have_content(@pinkie_pie.name)
        end
      end

      it "can see error if friend is not in database (I'm sorry your friend cannot be found)"
    end
    it "can see a parties section with pertinent info"
      # - Invited
      #   - Movie Title
      #   - Date and Time
      #   - Status == Invited
      # - Created
      #   - Movie Title
      #   - Date and Time
      #   - Status == Host
  end

  describe "As a non-registered user" do
    it "can see 400 errors when trying to access the database" do
      visit "/dashboard"
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    # it "can redirect you to welcome? (does this imply a custom 400 error page?)"
  end
end
