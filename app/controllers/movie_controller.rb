class MovieController < ApplicationController
  def top_forty
    @movies = MovieFacade.top_forty
  end

  def search
    @movies = MovieFacade.search(params[:query])
  end

  # def index
  #   if params[:query].nil?
  #     top_forty
  #   else
  #     search
  #   end
  # end
end
