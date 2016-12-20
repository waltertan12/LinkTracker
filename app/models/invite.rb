class Invite < ApplicationRecord
  validates :invite_digest, presence: true
  validates :valid, inclusion: { in: [true, false] }
  validates :expiration_date, presence: true
end
