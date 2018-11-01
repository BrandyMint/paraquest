class Slide < ApplicationRecord
  include ImageWithGeometry

  mount_uploader :image, ImageUploader

  has_many :games

  scope :ordered, -> { order 'id desc' }

  validates :title, presence: true
  validates :image, presence: true

  def to_s
    "##{id} #{title}"
  end
end
