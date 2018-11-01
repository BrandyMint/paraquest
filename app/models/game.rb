class Game < ApplicationRecord

  attr_accessor :current_slide_width
  attr_accessor :current_slide_height
  attr_accessor :click_top
  attr_accessor :click_left

  belongs_to :user
  belongs_to :slide

  validates :slide_id, uniqueness: { scope: :user_id }

  alias_attribute :left, :x
  alias_attribute :top, :y

  before_save do
    self.x = 100.0 * click_left.to_f / current_slide_width.to_f
    self.y = 100.0 * click_top.to_f / current_slide_height.to_f
  end

  def coordinate
    Coordinate.
      new(x: x, y: y).
      freeze
  end

  def css_style
    "top: #{top}%; left: #{left}%"
  end
end
