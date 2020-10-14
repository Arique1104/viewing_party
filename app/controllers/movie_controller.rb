class MovieController < ApplicationController
  before_action :require_user

  def top_forty
    @movies = MovieFacade.top_forty
  end

  def search
    @movies = MovieFacade.search(params[:query])
  end

  def show
    @user = current_user
    @movie = MovieFacade.movie_details(params[:id].to_i)
  end

  # def index
  #   if params[:query].nil?
  #     top_forty
  #   else
  #     search
  #   end
  # end
end
