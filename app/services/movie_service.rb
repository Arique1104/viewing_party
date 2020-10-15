class MovieService
  def self.top_forty
    # https://api.themoviedb.org/3/discover/movie?api_key=ENV['MOVIE_API_KEY']&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1
    results = []
    page = 1
    2.times do
      response = Faraday.get('https://api.themoviedb.org/3/discover/movie') do |faraday|
        faraday.params[:api_key] = ENV['MOVIE_API_KEY']
        faraday.params[:language] = 'en-US'
        faraday.params[:sort_by] = 'popularity.desc'
        faraday.params[:include_adult] = false
        faraday.params[:include_video] = false
        faraday.params[:page] = page
      end
      json = JSON.parse(response.body, symbolize_names: true)
      results << json[:results]
      page += 1
    end
    results.flatten.sort_by do |result|
      result[:vote_average]
    end.reverse
  end

  def self.search_movies(query)
    all_results = format_json(query)
    all_results.flatten.sort_by do |result|
      result[:vote_average]
    end.reverse
  end

  def self.format_json(query)
    all_results = []
    page = 1
    2.times do
      response = format_faraday(query, page)
      json = JSON.parse(response.body, symbolize_names: true)
      all_results << json[:results]
      page += 1
    end
    all_results
  end

  def self.format_faraday(query, page)
    Faraday.get('https://api.themoviedb.org/3/search/movie') do |faraday|
      faraday.params[:api_key] = ENV['MOVIE_API_KEY']
      faraday.params[:language] = 'en-US'
      faraday.params[:query] = query
      faraday.params[:page] = page
    end
  end

  def self.movie_details(movie_id)
    # https://api.themoviedb.org/3/movie/677638
    # ?api_key=ENV['MOVIE_API_KEY']
    # &language=en-US
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}") do |faraday|
      faraday.params[:api_key] = ENV['MOVIE_API_KEY']
      faraday.params[:language] = 'en-US'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_details(movie_id)
    # https://api.themoviedb.org/3/movie/677638/credits
    # ?api_key=ENV['MOVIE_API_KEY']
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits") do |faraday|
      faraday.params[:api_key] = ENV['MOVIE_API_KEY']
    end
    cast = JSON.parse(response.body, symbolize_names: true)
    cast[:cast][0..9]
  end

  def self.reviews(movie_id)
    # https://api.themoviedb.org/3/movie/337401/reviews
    # ?api_key=ENV['MOVIE_API_KEY']
    # &language=en-US&page=1
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews") do |faraday|
      faraday.params[:api_key] = ENV['MOVIE_API_KEY']
      faraday.params[:language] = 'en-US'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
