# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  resource_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Favorite < ApplicationRecord
  validates :user_id,     presence: true, numericality: { only_integer: true }
  validates :resource_id, presence: true, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :resource
end
