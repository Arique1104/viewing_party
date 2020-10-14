class PartiesController < ApplicationController
  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:movie_id])
    @runtime = @movie.runtime[:total]
    @friendships = User.where(id: @user.friendships.pluck(:friend_id))
  end
end
