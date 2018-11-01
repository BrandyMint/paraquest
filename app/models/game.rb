class Game < ApplicationRecord

  attr_accessor :current_slide_width
  attr_accessor :current_slide_height
  attr_accessor :click_top
  attr_accessor :click_left

  belongs_to :user
  belongs_to :slide

  # TODO Вынести в JS
  before_validation do
    self.x = 100.0 * click_left.to_f / current_slide_width.to_f
    self.y = 100.0 * click_top.to_f / current_slide_height.to_f
  end

  validates :slide_id, uniqueness: { scope: :user_id }
  validates :x, presence: true, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
  validates :y, presence: true, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }

  alias_attribute :left, :x
  alias_attribute :top, :y

  def coordinate
    Coordinate.
      new(x: x, y: y).
      freeze
  end

  def css_style
    "top: #{top}%; left: #{left}%"
  end
end
