# == Schema Information
#
# Table name: invites
#
#  id              :integer          not null, primary key
#  invite_digest   :string           not null
#  is_valid        :boolean          default("false")
#  expiration_date :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Invite < ApplicationRecord
  validates :invite_digest, presence: true
  validates :is_valid, inclusion: { in: [true, false] }
  validates :expiration_date, presence: true

  def self.generate_invite
    Invite.create(
      invite_digest: SecureRandom::base64(32), 
      is_valid: true, 
      expiration_date: 1.day.from_now
    )
  end

  def self.redeem_invite(invite)
    invite = Invite.find_by(invite_digest: invite.invite_digest, is_valid: true)

    invite.destroy if invite && invite.expiration_date > Time.now
  end

  def self.destroy_invalid_invites
    Invite.where(is_valid: false)
      .or(Invite.where("expiration_date < ?", Time.now))
      .destroy_all
  end
end
