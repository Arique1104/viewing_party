class MovieService

  def self.top_forty
    results = []
    page = 1
    2.times do
      response = conn.get("/3/discover/movie?api_key=#{ENV['MOVIE_API_KEY']}&#{language}&#{sort}&#{adult}&#{video}&page=#{page}")
      json = JSON.parse(response.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    flatten_results(results)
  end

  def self.search_movies(query)
    results = []
    page = 1
    2.times do
      response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&#{language}&query=#{query}&page=#{page}&#{adult}")
      json = JSON.parse(response.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    flatten_results(results)
  end

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_API_KEY']}&#{language}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIE_API_KEY']}")
    cast = JSON.parse(response.body, symbolize_names: true)
    cast[:cast][0..9]
  end

  def self.reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIE_API_KEY']}&#{language}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.flatten_results(results)
    results.flatten.sort_by do |result|
      result[:vote_average]
    end.reverse
  end

  def self.sort
    'sort_by=popularity.desc'
  end

  def self.video
    'include_video=false'
  end

  def self.adult
    'include_adult=false'
  end

  def self.language
    'language=en-US'
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end
end
