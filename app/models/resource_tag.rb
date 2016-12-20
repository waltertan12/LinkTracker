class ResourceTag < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
  validates :tag_id,     presence: true, numericality: { only_integer: true }

  belongs_to :resource
  belongs_to :tag
end
