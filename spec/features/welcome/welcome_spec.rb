require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "as a visitor" do
    before :each do
      @rainbow_dash = User.create!(email:"rainbow_dash@email.com", password:"user")
      @pinkie_pie = User.create!(email:"pinkie_pie@email.com", password:"user")
      @twilight_sparkle = User.create!(email:"twilight_sparkle@email.com", password:"user")
      @rarity = User.create!(email:"rarity@email.com", password:"user")
      @applejack = User.create!(email:"applejack@email.com", password:"user")
      @fluttershy = User.create!(email:"fluttershy@email.com", password:"user")
      @spike = User.create!(email:"spike@email.com", password:"user")
      @starlight_glimmer = User.create!(email:"starlight_glimmer@email.com", password:"user")

      @rainbow_dash.followers << [@rarity, @applejack, @twilight_sparkle]
      @twilight_sparkle.followers << [@spike, @starlight_glimmer]
      @pinkie_pie.followers << [@rainbow_dash, @twilight_sparkle, @rarity, @applejack, @fluttershy, @spike, @starlight_glimmer]
    end

    it "can show welcome message" do
      visit '/'
      expect(page).to have_content("Welcome to Viewing Party")
    end

    it "can show a brief description of the application" do

    end

    it "can show email and password fields with a button to login" do

    end

    it "can show a link to register" do

    end
  end
end
