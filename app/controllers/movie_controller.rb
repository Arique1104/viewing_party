class MovieController < ApplicationController
  before_action :require_user

  def show
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id].to_i)
  end

  def index
    @user = current_user
    # if params[:query]
    #   @movies = MovieFacade.search(params[:query])
    # else
    #   @movies = MovieFacade.top_forty
    # end
    @movies = if params[:query]
                MovieFacade.search(params[:query])
              else
                MovieFacade.top_forty
              end
  end
end
