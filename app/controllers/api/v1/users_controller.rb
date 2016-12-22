class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @invite = Invite.find_by(invite_digest: invite_digest)

    if @invite && @invite.is_valid && @user.save
      log_in_user!(@user)
      render json: @user
    elsif !@invite || !@invite.is_valid
      render json: {"data": "Invalid invite code"}
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def update
    # TODO
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    render json: {}
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def invite_digest
    params[:invite][:invite_digest]
  end
end
