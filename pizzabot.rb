class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def directions_to(next_location)
    horizontal_difference = next_location.x - self.x
    horizontal_orientation = if horizontal_difference > 0
      "E"
    elsif horizontal_difference < 0
      "W"
    else
      ""
    end

    vertical_difference = next_location.y - self.y
    vertical_orientation = if vertical_difference > 0
      "N"
    elsif vertical_difference < 0
      "S"
    else
      ""
    end

    horizontal_orientation*horizontal_difference.abs + vertical_orientation*vertical_difference.abs
  end
end
