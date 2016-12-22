# == Schema Information
#
# Table name: resource_tags
#
#  id          :integer          not null, primary key
#  resource_id :integer          not null
#  tag_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResourceTag < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
  validates :tag_id,     presence: true, numericality: { only_integer: true }

  belongs_to :resource
  belongs_to :tag
end
