class SearchController < ApplicationController
  def top_forty
    conn = Faraday.new(url: "https://api.themoviedb.org")
    # do |faraday|
    #   # faraday.headers['media_type'] = 'movies'
    #   # faraday.headers['time_window'] = 'day'
    #   faraday.headers['api_key'] = ENV["MOVIE_API_KEY"]
    # end

    response = conn.get("/discover/movie?sort_by=popularity.desc/?#{ENV["MOVIE_API_KEY"]}")
    # require "pry"; binding.pry
  end
end
