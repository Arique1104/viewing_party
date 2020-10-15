class MovieDetails
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :description,
              :cast_members,
              :reviews,
              :id

  def initialize(details)
    @title = details[:movie_details][:original_title]
    @vote_average = details[:movie_details][:vote_average]
    @runtime = format_runtime(details[:movie_details][:runtime])
    @genres = format_genre(details[:movie_details][:genres])
    @description = details[:movie_details][:overview]
    @cast_members = format_cast_members(details[:cast_details])
    @reviews = format_reviews(details[:reviews][:results])
    @id = details[:movie_details][:id]
  end

  def format_genre(genre_array)
    results = []
    genre_array.each do |genre|
      results << genre[:name]
    end
    results
  end

  def format_runtime(min)
    decimal = min.to_f / 60

    minutes = (decimal.to_s[-3..-1].to_f * 60).to_i

    hours = decimal.to_i

    {
      min: minutes,
      hr: hours,
      total: min
    }
  end

  def format_cast_members(cast)
    results = []
    cast.each do |member|
      results << CastMember.new(member)
    end
    results
  end

  def format_reviews(reviews)
    results = []
    reviews.each do |review|
      results << MovieReview.new(review)
    end
    results
  end
end
