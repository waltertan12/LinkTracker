class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_email, user_password)

    return log_in_user!(@user) if @user
    
    render json: "Invalid credentials", status: 403
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    render json: {}
  end

  private
  def user_email
    params[:user][:email]
  end

  def user_password
    params[:user][:password]
  end
end
