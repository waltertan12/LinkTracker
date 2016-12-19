class User < ApplicationRecord
  has_many :resources
  has_many :favorites
  has_many :links,    through: :resources
end
