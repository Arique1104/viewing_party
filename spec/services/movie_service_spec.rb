require 'rails_helper'

describe MovieService do
  context "instance methods" do
    context "#top_forty" do
      it "returns movie data" do
        require "pry"; binding.pry
        results = MovieService.top_forty

        expect(results.count).to be_between(1, 40)
        expect(results).to be_a Array
        movie_data = results.first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Integer).or be_a(Float)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)
      end
    end

    context "#search_movies(query)" do
      it "returns movie data" do
        results = MovieService.search_movies("Antman")

        expect(results.count).to be_between(0, 40)

        expect(results).to be_a Array
        movie_data = results.first

        expect(movie_data).to have_key :id
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Integer).or be_a(Float)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)
      end
    end
  end
end
