class Game < ApplicationRecord
  belongs_to :user
  belongs_to :slide

  validates :slide_id, uniqueness: { scope: :user_id }

  def coordinate
    Coordinate.
      new(x: coordinate_x, y: coordinate_y).
      freeze
  end
end
