# As an authenticated user,
# When I visit the '/discover' path
# I should see
#
#  Button to Discover top 40 movies
# Details When the user clicks on the top 40 button they should be taken to the movies page.
#
#  A text field to enter keyword(s) to search by movie title
#  A Button to Search by Movie Title
# Details When the user clicks on the Search button they should be taken to the movies page
#
# The movies will be retrieved by consuming The MovieDB API

require "rails_helper"

RSpec.describe "Discover Landing Page" do
  describe "As an authorized user" do
    before(:each) do
      # will add back in once we establish authentication
      # @wilmer = User.create!(email: "wilmer@example.com", password: "securepassword")
      # # require "pry"; binding.pry
      #
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@wilmer)
      @results = {:popularity=>1425.298,
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
    end
    it "can click on button for top 40 movies return" do

      visit '/discover'

      expect(page).to have_button("Top 40 Movies")
    end

    it "can return results of top forty films" do
      visit '/discover'
      click_on "Top 40 Movies"
      expect(current_path).to eq('/movies/top_forty')
save_and_open_page
      json_response = File.read('spec/fixtures/top_forty_results.json')
      # parsed = JSON.parse(json_response, symbolize_names: true)

      require "pry"; binding.pry

      # stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["MOVIE_API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")

      # expect(page).to have_content("Discover Top Movies")
      # expect(page).to have_content("Vote Average:")
    end
  end
end
