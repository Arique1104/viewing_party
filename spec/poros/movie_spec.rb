require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    attrs = {
      id: 23456,
      title: 'Mulan',
      vote_average: 7.6,
      overview: 'Great movie!'
    }
    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq('Mulan')
    expect(movie.vote_average).to eq(7.6)
    expect(movie.description).to eq('Great movie!')
  end
end
