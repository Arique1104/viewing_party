require 'rails_helper'

RSpec.describe "User registration form" do
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

    visit '/'
  end

  it "can create a new user" do
    expect(page).to have_link("New to Viewing Party? Register Here")

    click_link "New to Viewing Party? Register Here"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Please Register for an Account")


    email = "celestia@email.com"
    password = "test"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button "Register"

    expect(current_path).to eq("/dashboard")
  end

  it "can keep a user logged in after registering" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia@email.com"
    password = "test"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button "Register"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome #{email}!")
  end

  it "can have a link to login that links back to welcome page" do
    click_link "New to Viewing Party? Register Here"
    expect(page).to have_link("Already Registered? Log in Here")
    click_link "Already Registered? Log in Here"
    expect(current_path).to eq("/")
  end

  it "can give a failure if user is already in system" do
    click_link "New to Viewing Party? Register Here"

    fill_in :email, with: @rainbow_dash.email
    fill_in :password, with: @rainbow_dash.password
    fill_in :password_confirmation, with: @rainbow_dash.password

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Email (has already been taken)")
  end

  it "can give a failure if email is not a valid email" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia"
    password = "test"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Email (is invalid)")
  end

  it "can give a failure if passwords do not match" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia@email.com"
    password = "test"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: "password"

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Password_confirmation (doesn't match Password)")
  end

  it "can give multiple error messages" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia"
    password = "test"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: "password"

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Email (is invalid); Password_confirmation (doesn't match Password)")
  end

  it "can have requirements for strong-password such as length and special characters"
end
