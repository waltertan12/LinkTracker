class ResourceLink < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
  validates :link_id,     presence: true, numericality: { only_integer: true }

  belongs_to :resource
  belongs_to :link
end
