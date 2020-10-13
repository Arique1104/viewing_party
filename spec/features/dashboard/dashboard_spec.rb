require "rails_helper"

RSpec.describe "Dashboard Page", type: :feature do
  describe "As a registered user" do
    before :each do
      @twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")

      @spike = User.create!(name:"spike", email:"spike@email.com", password:"User@us3r")
      @starlight_glimmer = User.create!(name:"Starlight", email:"starlight_glimmer@email.com", password:"User@us3r")
      @pinkie_pie = User.create!(name:"pinkie", email:"pinkie_pie@email.com", password:"User@us3r")

      @rainbow_dash = User.create!(name:"Rainbow Dash", email:"rainbow_dash1@email.com", password:"User@us3r")
      # @rarity = User.create!(name:"rarity", email:"rarity@email.com", password:"User@us3r")
      # @applejack = User.create!(name:"applejack", email:"applejack@email.com", password:"User@us3r")
      # @fluttershy = User.create!(name:"fluttershy", email:"fluttershy@email.com", password:"User@us3r")

      @twilight_sparkle.friendships.create!(friend:@spike)
      @spike.friendships.create!(friend:@twilight_sparkle)
      @twilight_sparkle.friendships.create!(friend:@starlight_glimmer)
      @starlight_glimmer.friendships.create!(friend:@twilight_sparkle)
      @rainbow_dash.friendships.create!(friend:@twilight_sparkle)
      @twilight_sparkle.friendships.create!(friend:@rainbow_dash)
      # @party_1  = @twilight_sparkle.parties.create!(movie_id:"4", runtime:"12", date:"Oct 12, 1940", start:"12 pm")

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
    end


    it "can see friends section with friends you've added" do
      within "#friends" do
        expect(page).to have_content(@spike.name.capitalize)
        expect(page).to have_content(@starlight_glimmer.name.capitalize)
        expect(page).to have_content(@rainbow_dash.name.capitalize)
        expect(page).to_not have_content(@pinkie_pie.name.capitalize)
      end
    end

    it "can add a friend" do
      within "#friends" do
        expect(page).to_not have_content(@pinkie_pie.name)
        fill_in :email, with: @pinkie_pie.email
        expect(page).to have_button("Add Friend")
        click_button "Add Friend"
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content(@pinkie_pie.name.capitalize)
      end
    end

    it "can see error if friend is not in database (I'm sorry your friend cannot be found)" do
      within "#friends" do
        fill_in :email, with: "bad_email@email.com"
        click_button "Add Friend"
        expect(current_path).to eq('/dashboard')
      end
      expect(page).to have_content("I'm sorry your friend cannot be found")
    end

    it "can see a parties section with pertinent info"
    #   # - Invited
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

  describe "As a registered user with no friends" do
    before :each do
      @no_friend_user = User.create!(name:"Friendless", email:"bemyfriend@email.com", password:"User@us3r")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@no_friend_user)

      visit "/dashboard"
    end

    it "can see friends section is empty if no friends are added" do
      within "#friends" do
        expect(page).to have_content("You currently have no friends")
      end
    end
  end
end
