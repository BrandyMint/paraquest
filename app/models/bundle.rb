class Bundle < ApplicationRecord
  include Workflow

  belongs_to :user

  scope :ordered, -> { order 'id desc' }
  scope :published, -> { with_published_state }

  has_many :slides, -> { ordered }, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :user_id }

  workflow_column :state
  workflow do
    state :draft do
      event :publish, transitions_to: :published
      event :private, transitions_to: :privated
    end
    state :published
    state :privated
  end

  def image
    (slides.first || Slide.new).image
  end

  def to_s
    ["##{id}",title].join ' '
  end
end
