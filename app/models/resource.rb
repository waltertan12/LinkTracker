class Resource < ApplicationRecord
  validates :title, presence: true
  validates :resource_type_id, :presence: true, numericality: { only_integer: true }
  validates :user_id, :presence: true, numericality: { only_integer: true }
  validates :private, inclusion: { in: [true, false] }
  validates :rating, :presence: true, numericality: { 
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }

  belongs_to :user
  has_one    :resource_type
  has_many   :resource_tags
  has_many   :links,        through: :rresources
  has_many   :tags,         through: :resource_tag
end
