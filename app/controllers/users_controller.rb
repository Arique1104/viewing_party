class UsersController < ApplicationController
  def show
    if User.exists?(email:params[:email])
      @user = User.find_by(email:params[:email])
    else
      flash[:error] = "Your credentials do not match any users in the system. Please try again or register first."
      redirect_to "/"
      #Probably want to discuss, should this route back to welcome or to /register?
    end
  end

  def new

  end
end
