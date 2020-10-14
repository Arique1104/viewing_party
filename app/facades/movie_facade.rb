class MovieFacade
  def self.top_forty
    json = MovieService.top_forty
    @movies = json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search(query)
    json = MovieService.search_movies(query)
    @movies = json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(movie_id)
    details = {}
    details[:movie_details] = MovieService.movie_details(movie_id)
    details[:cast_details] = MovieService.cast_details(movie_id)
    details[:reviews] = MovieService.reviews(movie_id)
    @movie = MovieDetails.new(details)
  end
end
