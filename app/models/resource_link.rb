# == Schema Information
#
# Table name: resource_links
#
#  id          :integer          not null, primary key
#  resource_id :integer          not null
#  link_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResourceLink < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
  validates :link_id,     presence: true, numericality: { only_integer: true }

  belongs_to :resource
  belongs_to :link
end
