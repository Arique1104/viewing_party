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
end
