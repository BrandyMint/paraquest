class Slide < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :ordered, -> { order 'id desc' }

  validates :title, presence: true
  validates :image, presence: true
end
