class UsersController < ApplicationController
  before_action :require_user, only: :show
  
  def new

  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to "/dashboard"
    else
      generate_flash(new_user)
      redirect_to "/register"
    end
  end

  def show
    # @user = User.find(session[:user_id])
    @user = current_user
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
