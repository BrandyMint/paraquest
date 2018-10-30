class Coordinate
  include Virtus.model
  attribute :x, Integer
  attribute :y, Integer

  def to_s
    [x,y].join '⨯'
  end
end
