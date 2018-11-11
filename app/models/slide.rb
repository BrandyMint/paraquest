class Slide < ApplicationRecord
  include ImageWithGeometry

  mount_uploader :image, SlideImageUploader

  belongs_to :bundle
  has_many :slide_games

  scope :ordered, -> { order 'id desc' }

  validates :details, presence: true
  validates :image, presence: true

  def to_s
    "##{id}"
  end
end
