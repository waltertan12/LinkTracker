class Api::V1::InvitesController < ApplicationController
    before_action :logged_in?, :is_admin?

    def create
      @invite = Invite.generate_invite
      render json: @invite if invite 
    end

    def destroy
      @invite = Invite.find_by(invite_digest: params[:invite][:invite_digest])

      if @invite && @invite.destroy
        render json: @invite
      else
        render json: @invite.errors.full_messages, status: 400
      end
    end

    def destroy_all
      Invite.destroy_invalid_invites
    end
end
