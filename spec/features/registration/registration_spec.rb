require 'rails_helper'

RSpec.describe "User registration form" do
  before :each do
    @rainbow_dash = User.create!(email:"rainbow_dash@email.com", password:"User@us3r")
    @pinkie_pie = User.create!(email:"pinkie_pie@email.com", password:"User@us3r")
    @twilight_sparkle = User.create!(email:"twilight_sparkle@email.com", password:"User@us3r")
    @rarity = User.create!(email:"rarity@email.com", password:"User@us3r")
    @applejack = User.create!(email:"applejack@email.com", password:"User@us3r")
    @fluttershy = User.create!(email:"fluttershy@email.com", password:"User@us3r")
    @spike = User.create!(email:"spike@email.com", password:"User@us3r")
    @starlight_glimmer = User.create!(email:"starlight_glimmer@email.com", password:"User@us3r")

    # @rainbow_dash.followers << [@rarity, @applejack, @twilight_sparkle]
    # @twilight_sparkle.followers << [@spike, @starlight_glimmer]
    # @pinkie_pie.followers << [@rainbow_dash, @twilight_sparkle, @rarity, @applejack, @fluttershy, @spike, @starlight_glimmer]

    visit '/'
  end

  it "can create a new user" do
    expect(page).to have_link("New to Viewing Party? Register Here")

    click_link "New to Viewing Party? Register Here"

    expect(current_path).to eq("/register")

    expect(page).to have_content("Please Register for an Account")


    email = "celestia@email.com"
    password = "Secure#password1"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button "Register"

    expect(current_path).to eq("/dashboard")
  end

  it "can keep a user logged in after registering" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia@email.com"
    password = "Secure#password1"

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
    password = "Secure#password1"

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
    password = "Secure#password1"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: "Unsecure_password2"

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Password_confirmation (doesn't match Password)")
  end

  it "can give failure message if password requirements are not met" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia@email.com"
    password = "Secure_password1"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Password (Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character)")
  end

  it "can give multiple error messages" do
    click_link "New to Viewing Party? Register Here"

    email = "celestia"
    password = "Secure#password1"

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: "Unsecure_password2"

    click_button "Register"
    expect(current_path).to eq("/register")
    expect(page).to have_content("ERROR: Password_confirmation (doesn't match Password); Email (is invalid)")
  end
end
