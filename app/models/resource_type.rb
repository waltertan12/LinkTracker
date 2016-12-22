# == Schema Information
#
# Table name: resource_types
#
#  id            :integer          not null, primary key
#  resource_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ResourceType < ApplicationRecord
  validates :resource_id, presence: true, numericality: { only_integer: true }
end
