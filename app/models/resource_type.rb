class ResourceType < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
end
