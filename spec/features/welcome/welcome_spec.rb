require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "as a visitor" do
    before :each do
      @rainbow_dash = User.create!(email:"rainbow_dash@email.com", password:"User@us3r")
      @pinkie_pie = User.create!(email:"pinkie_pie@email.com", password:"User@us3r")
      @twilight_sparkle = User.create!(email:"twilight_sparkle@email.com", password:"User@us3r")
      @rarity = User.create!(email:"rarity@email.com", password:"User@us3r")
      @applejack = User.create!(email:"applejack@email.com", password:"User@us3r")
      @fluttershy = User.create!(email:"fluttershy@email.com", password:"User@us3r")
      @spike = User.create!(email:"spike@email.com", password:"User@us3r")
      @starlight_glimmer = User.create!(email:"starlight_glimmer@email.com", password:"User@us3r")

      @rainbow_dash.followers << [@rarity, @applejack, @twilight_sparkle]
      @twilight_sparkle.followers << [@spike, @starlight_glimmer]
      @pinkie_pie.followers << [@rainbow_dash, @twilight_sparkle, @rarity, @applejack, @fluttershy, @spike, @starlight_glimmer]

      visit '/'
    end

    it "can show welcome page" do
      expect(page).to have_content("Welcome to Viewing Party")

      expect(page).to have_content("This application lets you explore movies and create a viewing party event for you and your friends to watch a movie together.")
      expect(page).to_not have_link("Sign Out")
    end

    it "can log in with valid credentials" do
      fill_in :email, with:@pinkie_pie.email
      fill_in :password, with:@pinkie_pie.password
      click_button "Sign In"
      expect(current_path).to eq("/dashboard")

      expect(page).to have_content("Welcome #{@pinkie_pie.email}!")
      expect(page).to have_link("Sign Out")
    end

    it "can show a link to register" do
      expect(page).to have_link("New to Viewing Party? Register Here")
      click_link "New to Viewing Party? Register Here"
      expect(current_path).to eq("/register")
      expect(page).to have_content("Please Register for an Account")
    end

    #Exploration topic? ActionMailer?
    it "can show a link for forgot password email reset"

    it "can show a flash message and redirect back to welcome if login email is incorrect" do
      fill_in :email, with:@pinkie_pie.email
      fill_in :password, with:"wrong_password"
      click_button "Sign In"
      expect(current_path).to eq("/")
      expect(page).to have_content("Something went wrong. Please renter your credentials or register below.")
    end

    it "can show a flash message and redirect back to welcome if login email is not a valid email" do
      fill_in :email, with:"pinkie_pie"
      fill_in :password, with:@pinkie_pie.password
      click_button "Sign In"
      expect(current_path).to eq("/")
      expect(page).to have_content("Something went wrong. Please renter your credentials or register below.")
    end

    it "can show a flash message and redirect back to welcome if login email isn't in database" do
      fill_in :email, with:"dione@email.com"
      fill_in :password, with:"user"
      click_button "Sign In"
      expect(current_path).to eq("/")
      expect(page).to have_content("Something went wrong. Please renter your credentials or register below.")
    end
  end
end
