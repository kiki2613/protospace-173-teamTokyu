class Prototype < ApplicationRecord
  has_one_attached :image

  validates :title, :catch_copy, :concept, :image, presence: true
  
end
