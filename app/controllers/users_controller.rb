class UsersController < ApplicationController
  def new

  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to "/dashboard"
    else
      flash[:failure] = "Something went wrong! Are you missing a required field? Are you already registered?"
      # Eventually change this into validation error messages that rails already has
      #Example: "ActiveRecord::RecordInvalid: Validation failed: Password confirmation doesn't match Password"
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
