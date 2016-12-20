class Link < ApplicationRecord
  validates :link_source, presence: true
  validates :resource_id, presence: true, numericality: { only_integer: true }

  belongs_to :resource
end
