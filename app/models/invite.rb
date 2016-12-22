# == Schema Information
#
# Table name: invites
#
#  id              :integer          not null, primary key
#  invite_digest   :string           not null
#  valid           :boolean          default("false")
#  expiration_date :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Invite < ApplicationRecord
  validates :invite_digest, presence: true
  validates :valid, inclusion: { in: [true, false] }
  validates :expiration_date, presence: true
end
