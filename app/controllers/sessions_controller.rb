class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:failure] = 'Something went wrong. Please renter your credentials or register below.'
      redirect_to '/'
    end
  end

  def delete
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out!'
    redirect_to welcome_path
  end
end
