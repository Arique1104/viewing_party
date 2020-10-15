class PartiesController < ApplicationController
  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:movie_id])
    @runtime = @movie.runtime[:total]
    @friendships = User.where(id: @user.friendships.pluck(:friend_id))
  end

  def create
    date = "#{party_params["day(2i)"]}/#{party_params["day(3i)"]}/#{party_params["day(1i)"]}"
    start_time = "#{party_params["start_time(4i)"]}:#{party_params["start_time(5i)"]}"


    new_party = current_user.parties.new(movie_title: party_params[:movie_title], runtime: party_params[:runtime], date: date, start_time: start_time)
    if new_party.save
require "pry"; binding.pry
      redirect_to '/dashboard'
    else
      require "pry"; binding.pry
      generate_flash(new_party)
      render :new
    end
  end

  private

  def party_params
    params.permit(:movie_title, :runtime, "day(1i)", "day(2i)", "day(3i)", "start_time(4i)", "start_time(5i)")
  end
end
