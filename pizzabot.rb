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

  def ==(other_location)
    self.x == other_location.x && self.y == other_location.y
  end
end

class Grid
  attr_reader :x_range, :y_range

  def initialize(width, height)
    validate_inputs(width, height)

    @x_range = (0..width)
    @y_range = (0..height)
  end

  def include?(location)
    @x_range.include?(location.x) && @y_range.include?(location.y)
  end

  def ==(other_grid)
    self.x_range == other_grid.x_range && self.y_range == other_grid.y_range
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
  attr_reader :grid, :locations

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

  class << self
    def create_from_input(stdin)
      grid_specification, locations = /^(\d+x\d+)(\(.+)$/.match(stdin.gsub(" ", "")).captures

      width, height = grid_specification.split("x").map(&:to_i)
      grid = Grid.new(width, height)

      locations = locations[1...-1].split(")(").map do |location|
        x, y = location.split(",").map(&:to_i)
        Location.new(x,y)
      end
      # account for starting from origin location (0,0) on the grid
      locations.unshift(Location.new(0,0))

      PizzaBot.new(grid, locations)
    end
  end
end
