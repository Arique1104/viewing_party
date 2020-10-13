class WelcomeController < ApplicationController
  def index
    return redirect_to '/dashboard' while current_user
  end
end
