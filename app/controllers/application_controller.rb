class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token

    true
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def is_admin?
    !!current_user && current_user.admin?
  end

  def ensure_user_logged_in
    render json: "User must be logged in", status: 403 unless logged_in?
  end

  def ensure_user_is_admin
    unless logged_in? && is_admin?
      render json: "User has insufficient permissions", status: 403
    end
  end
end
