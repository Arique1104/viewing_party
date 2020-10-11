class SearchController < ApplicationController
  def top_forty
    conn = Faraday.new(url: "https://api.themoviedb.org")
    response = conn.get("/discover/movie?sort_by=popularity.desc/?#{ENV["MOVIE_API_KEY"]}")
    top_40 = []
    2.times do
      num = 1
      response = Faraday.get("https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["MOVIE_API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{num}")
      json = JSON.parse(response.body, symbolize_names: true)
      top_40 << json[:results]
      num += 1
    end
    @results = top_40.flatten
  end
end
