require "rails_helper"

RSpec.describe "New Viewing Party Page", type: :feature do
  describe "As a registered user" do
    before :each do
      @twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")

      @spike = User.create!(name:"spike", email:"spike@email.com", password:"User@us3r")
      @starlight_glimmer = User.create!(name:"Starlight", email:"starlight_glimmer@email.com", password:"User@us3r")
      @pinkie_pie = User.create!(name:"pinkie", email:"pinkie_pie@email.com", password:"User@us3r")

      @rainbow_dash = User.create!(name:"Rainbow Dash", email:"rainbow_dash1@email.com", password:"User@us3r")

      @twilight_sparkle.friendships.create!(friend:@spike)
      @spike.friendships.create!(friend:@twilight_sparkle)
      @twilight_sparkle.friendships.create!(friend:@starlight_glimmer)
      @starlight_glimmer.friendships.create!(friend:@twilight_sparkle)
      @rainbow_dash.friendships.create!(friend:@twilight_sparkle)
      @twilight_sparkle.friendships.create!(friend:@rainbow_dash)

      movie = {:popularity=>1425.298,
               :vote_count=>1762,
               :video=>false,
               :poster_path=>"/riYInlsq2kf1AWoGm80JQW5dLKp.jpg",
               :id=>497582,
               :adult=>false,
               :backdrop_path=>"/kMe4TKMDNXTKptQPAdOF0oZHq3V.jpg",
               :original_language=>"en",
               :original_title=>"Enola Holmes",
               :genre_ids=>[80, 18, 9648],
               :title=>"Enola Holmes",
               :vote_average=>7.6,
               :overview=>
                "While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.",
               :release_date=>"2020-09-23"}

      @enola = MovieFacade.movie_details(movie[:id])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@twilight_sparkle)
    end

    it "can create a new party routed from a movie details page" do
      visit "/movies/#{@enola.id}"
      within '#title' do
        click_button "Create Viewing Party for Movie"
      end

      expect(current_path).to eq('/viewing-party/new')
      within '#header' do
        expect(page).to have_content("Welcome #{@twilight_sparkle.name.capitalize}!")
      end

      within '#party' do
        expect(page).to have_content("Viewing Party Details")

        expect(page).to have_content("Movie Title")
        expect(page).to have_content(@enola.title)

        expect(page).to have_content("Duration of Party")
        expect(page).to have_content(@enola.runtime[:total])
        fill_in :runtime, with: 200

        expect(page).to have_content("Day") # form needs to be in calendar format
        fill_in :date, with: "Oct 15, 2020"

        expect(page).to have_content("Start Time") # form needs to be in time format
        fill_in :start_time, with: "7:00pm"

        within '#include-friends' do
          expect(page).to have_content(@spike.name)
          expect(page).to have_content(@starlight_glimmer.name)
          expect(page).to have_content(@rainbow_dash.name)

          within  "friend-#{@spike.id}" do
            page.check("participants_", :match => :first)
            find(:css, "#participants_[value='#{@spike.name}']").set(true)
          end
          # <%= check_box_tag 'participants[]', friend/user.id %>
          # checkboxes for all friends
        end

        click_button "Create Party"
      end

    end
    it "can see a failure if "

  end

  # describe "As a non-registered user" do
  #   it "can see 400 errors when trying to access the database" do
  #     visit "/viewing-party/new"
  #     expect(page).to have_content("The page you were looking for doesn't exist.")
  #   end
  # end
end
