class UsersController < ApplicationController
  before_action :require_user, only: :show
  def new; end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to '/dashboard'
    else
      generate_flash(new_user)
      redirect_to '/register'
    end
  end

  def show
    @user = current_user
    @friendships = User.where(id: @user.friendships.pluck(:friend_id))
    @my_parties = @user.parties
    party_ids = PartyParticipant.where(user: @user).pluck(:party_id)
    @invited_parties = Party.where(id: party_ids)
  end

  def add_friend
    new_friend = User.find_by(email: params[:email])
    if new_friend.nil?
      flash[:error] = "I'm sorry your friend cannot be found"
    else
      current_user.friendships.create!(friend: new_friend)
      new_friend.friendships.create!(friend: current_user)
    end
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
