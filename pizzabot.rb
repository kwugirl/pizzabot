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

class Grid
  def initialize(width, height)
    validate_inputs(width, height)

    @x_range = (0..width)
    @y_range = (0..height)
  end

  def include?(location)
    @x_range.include?(location.x) && @y_range.include?(location.y)
  end

  private

  def validate_inputs(width, height)
    unless non_negative_integer?(width) && non_negative_integer?(height)
      raise ArgumentError, "must have non_negative integer inputs"
    end
  end

  def non_negative_integer?(num)
    num.integer? && num >= 0
  end
end

class PizzaBot
  attr_reader :locations

  def initialize(grid, locations)
    @grid = grid
    @locations = locations.select {|location| grid.include?(location) }
  end

  def instructions
    instructions = []

    locations.each_cons(2) do |location_pair|
      start, finish = location_pair

      instructions << start.directions_to(finish)
    end

    instructions.join("D") + "D"
  end
end
