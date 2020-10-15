class MovieController < ApplicationController
  before_action :require_user

  def show
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id].to_i)
  end

  def index
    @user = current_user
    if params[:query].nil?
      @movies = MovieFacade.top_forty
    else
      @movies = MovieFacade.search(params[:query])
    end
  end
end
