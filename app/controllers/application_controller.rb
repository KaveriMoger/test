class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end



  def admin_only
    current_user
    if @current_user.role.id !=1
      redirect_to log_in_path, alert: "you dont have permission to perform this action"
    end
  end


  def authorize
    if current_user.blank?
      redirect_to log_in_path, alert: "You must be logged in to perform this action"
    end
  end



end
#new_user_session_path

