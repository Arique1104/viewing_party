class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:failure] = "Something went wrong. Please retry entering your credentials or registering as a user."
      redirect_to "/"
    end
  end
end
