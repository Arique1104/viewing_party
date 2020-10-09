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

RSpec.describe "As an authenticated user, When I visit the '/discover' path I should see" do
  it "Button to Discover top 40 movies" do
# will add back in once we establish authentication
    # @wilmer = User.create!(email: "wilmer@example.com", password: "securepassword")
    # # require "pry"; binding.pry
    #
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@wilmer)

    visit '/discover'

    expect(page).to have_button("Discover Top 40 Movies")
  end

  # it "" do
  # end
end
