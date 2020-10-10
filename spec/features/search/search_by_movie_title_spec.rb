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
    end
    it "can click on button for top 40 movies return" do

      visit '/discover'

      expect(page).to have_button("Top 40 Movies")
    end

    it "can return results of top forty films" do
      visit '/discover'
      click_on "Top 40 Movies"
      expect(current_path).to eq('/movies/top_forty')
      #Once the API is working and
      # expect(page).to have_content("#{movie.title}")
      # within "movie-#{movie.id}" do
      #   expect(page).to have_content("#{movie.vote_average}")
      #   expect(page).to have_content("#{movie.run_time}")
      # end
    end
  end
end
