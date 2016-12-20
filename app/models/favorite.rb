class Favorite < ApplicationRecord
  validates :user_id,     presence: true, numericality: { only_integer: true }
  validates :resource_id, presence: true, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :resource
end
