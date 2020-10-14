class Movie
  attr_reader  :id,
               :title,
               :vote_average,
               :description

  def initialize(movie_details)
    @id = movie_details[:id]
    @title = movie_details[:title]
    @vote_average = movie_details[:vote_average]
    @description = movie_details[:overview]
  end
end
