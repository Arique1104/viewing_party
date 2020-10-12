class MovieController < ApplicationController
  def top_forty
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/discover/movie?sort_by=popularity.desc/?#{ENV["MOVIE_API_KEY"]}")
    top_40 = []
    num = 1
    2.times do
      response = Faraday.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["MOVIE_API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{num}")
      json = JSON.parse(response.body, symbolize_names: true)
      top_40 << json[:results]
      num += 1
    end
    @results = top_40.flatten.sort_by do |result|
      result[:vote_average]
    end.reverse
  end
end
