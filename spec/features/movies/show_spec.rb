

require 'rails_helper'

RSpec.describe "Movie Show Page", type: :feature do
  describe "As an authenticated user" do
    before :each do
      @twilight_sparkle = User.create!(name:"Twilight", email:"twilight_sparkle@email.com", password:"User@us3r")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@twilight_sparkle)

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

      visit "/movies/#{@enola.id}"
    end

    it "Can show movie details page" do
      expect(page).to have_content("Welcome #{@twilight_sparkle.name.capitalize}!")

      within '#title' do
        expect(page).to have_button("Create Viewing Party for Movie")
        expect(page).to have_content(@enola.title)
      end

      within '#details' do
        expect(page).to have_content("Vote Average: #{@enola.vote_average}")
        expect(page).to have_content("Run Time: #{@enola.runtime[:hr]} hr #{@enola.runtime[:min]} min")
        @enola.genres.each do |genre|
          expect(page).to have_content(genre)
        end
      end
      within '#summary' do
        expect(page).to have_content(@enola.description)
      end

      within '#cast' do
        expect(page).to have_content(@enola.cast_members.first.name)
        expect(@enola.cast_members.count).to be_between(0, 10)
      end

      within '#reviews' do
        expect(page).to have_content("#{@enola.reviews.count} Review(s)")

        within "#reviews-#{@enola.reviews[0].author}" do
          expect(page).to have_content(@enola.reviews[0].author)
        end
        within "#reviews-#{@enola.reviews[1].author}" do
          expect(page).to have_content(@enola.reviews[1].author)
        end
      end
    end
  end


  describe "As a non-registered user" do
    before :each do
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
      @enola = Movie.new(movie)
      visit "/movies/#{@enola.id}"
    end

    it "can see 400 errors when trying to access the database" do

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
