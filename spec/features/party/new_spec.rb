# require "rails_helper"
#
# RSpec.describe "New Viewing Party Page", type: :feature do
#   describe "As a registered user" do
#     before :each do
#       @twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")
#
#       @spike = User.create!(name:"spike", email:"spike@email.com", password:"User@us3r")
#       @starlight_glimmer = User.create!(name:"Starlight", email:"starlight_glimmer@email.com", password:"User@us3r")
#       @pinkie_pie = User.create!(name:"pinkie", email:"pinkie_pie@email.com", password:"User@us3r")
#
#       @rainbow_dash = User.create!(name:"Rainbow Dash", email:"rainbow_dash1@email.com", password:"User@us3r")
#       # @rarity = User.create!(name:"rarity", email:"rarity@email.com", password:"User@us3r")
#       # @applejack = User.create!(name:"applejack", email:"applejack@email.com", password:"User@us3r")
#       # @fluttershy = User.create!(name:"fluttershy", email:"fluttershy@email.com", password:"User@us3r")
#
#       @twilight_sparkle.friendships.create!(friend:@spike)
#       @spike.friendships.create!(friend:@twilight_sparkle)
#       @twilight_sparkle.friendships.create!(friend:@starlight_glimmer)
#       @starlight_glimmer.friendships.create!(friend:@twilight_sparkle)
#       @rainbow_dash.friendships.create!(friend:@twilight_sparkle)
#       @twilight_sparkle.friendships.create!(friend:@rainbow_dash)
#       # @party_1  = @twilight_sparkle.parties.create!(movie_id:"4", runtime:"12", date:"Oct 12, 1940", start:"12 pm")
#
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@twilight_sparkle)
#     end
#
#     it "can visit the new party page" do
#       visit '/viewing-party/new'
#       expect(page).to have_content("Welcome #{@twilight_sparkle.name.capitalize}!")
#       within '#party' do
#         expect(page).to have_content("Viewing Party Details")
#         # PAUSING HERE BECAUSE I WANT A MOVIE DETAIL/SHOW PAGE FIRST
#         expect(page).to have_content(@moana.title)
#         expect(page).to have_content("")
#         expect(page).to have_content("")
#         expect(page).to have_content("")
#       end
#     end
#
#     it "can fill out a form to create a party" do
#
#     end
#
#     it "can see a failure if "
#
#   end
#
#   # describe "As a non-registered user" do
#   #   it "can see 400 errors when trying to access the database" do
#   #     visit "/viewing-party/new"
#   #     expect(page).to have_content("The page you were looking for doesn't exist.")
#   #   end
#   # end
# end
