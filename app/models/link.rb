# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  link_source :string           not null
#  resource_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Link < ApplicationRecord
  validates :link_source, presence: true
  validates :resource_id, presence: true, numericality: { only_integer: true }

  belongs_to :resource
end
