class PartiesController < ApplicationController
  before_action :require_user

  def new
    @user = current_user
    @movie = MovieFacade.movie_details(params[:movie_id])
    @runtime = @movie.runtime[:total]
    @friendships = User.where(id: @user.friendships.pluck(:friend_id))
  end

  def create
    new_party = current_user.parties.new(format_party)
    if params[:participants]
      new_party.save
      User.where(id: params[:participants]).each { |p| new_party.party_participants.create(user: p) }
      redirect_to '/dashboard'
    else
      redirect_to "/#{params[:movie_id]}/party/new"
      flash[:errors] = 'You did not add any friends!'
    end
  end

  private

  def party_params
    params.permit(:movie_title, :runtime, 'day(1i)', 'day(2i)', 'day(3i)', 'start_time(4i)', 'start_time(5i)')
  end

  def format_party
    schedule = Schedule.new(party_params)
    {
      movie_title: party_params[:movie_title],
      runtime: party_params[:runtime],
      date: schedule.date,
      start_time: schedule.start_time
    }
  end
end
