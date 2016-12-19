class Resource < ApplicationRecord
  belongs_to :user
  has_one    :resource_type
  has_many   :resource_tags
  has_many   :links,        through: :rresources
  has_many   :tags,         through: :resource_tag
end
