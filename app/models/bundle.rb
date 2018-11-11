class Bundle < ApplicationRecord
  belongs_to :user

  scope :ordered, -> { order 'id desc' }
  scope :published, -> { all }

  has_many :slides, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :user_id }

  def image
    (slides.first || Slide.new).image
  end

  def to_s
    ["##{id}",title].join ' '
  end
end
