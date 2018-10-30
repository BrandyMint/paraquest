class Game < ApplicationRecord
  belongs_to :user
  belongs_to :slide

  def coordinate
    Coordinate.
      new(x: coordinate_x, y: coordinate_y).
      freeze
  end
end
