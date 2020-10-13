class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    render file: 'public/404', status: 404 unless current_user
  end

  def generate_flash(resource)
    error_messages = String.new
    resource.errors.messages.each do |validation, message|
      error_messages += "#{validation.capitalize} (#{message[0]}); "
    end
    error_messages = error_messages.delete_suffix("; ")
    flash[:failure] = "ERROR: #{error_messages}"
  end
end
