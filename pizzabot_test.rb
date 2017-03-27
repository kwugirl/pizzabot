require 'minitest/autorun'
require './pizzabot'

class PizzaBotTest < Minitest::Test
  def test_directions_to_northeast_location
    start = Location.new(0,0)
    finish = Location.new(2,3)
    expected = "EENNN"

    assert_equal expected, start.directions_to(finish)
  end

  def test_directions_to_western_location
    start = Location.new(2,0)
    finish = Location.new(0,0)
    expected = "WW"

    assert_equal expected, start.directions_to(finish)
  end

  def test_directions_to_southern_location
    start = Location.new(0,3)
    finish = Location.new(0,0)
    expected = "SSS"

    assert_equal expected, start.directions_to(finish)
  end

  def test_cannot_create_invalid_grid
    assert_raises ArgumentError do
      Grid.new(-2,3)
    end

    assert_raises ArgumentError do
      Grid.new(3,-1)
    end
  end

  def test_includes_location_correctly
    grid = Grid.new(3,3)
    location_in_grid = Location.new(2,2)
    location_outside_grid = Location.new(-2,-2)

    assert grid.include?(location_in_grid)
    refute grid.include?(location_outside_grid)
  end

  def test_pizzabot_ignores_offgrid_locations
    grid = Grid.new(3,3)
    location_in_grid = Location.new(2,2)
    location_outside_grid = Location.new(-2,-2)
    locations = [location_in_grid, location_outside_grid]

    bot = PizzaBot.new(grid, locations)

    assert bot.locations.include? location_in_grid
    refute bot.locations.include? location_outside_grid
  end

  def test_pizzabot_produces_instructions_correctly
    grid = Grid.new(5,5)
    locations = [Location.new(0,0), Location.new(1,3), Location.new(4,4)]
    bot = PizzaBot.new(grid, locations)
    expected = "ENNNDEEEND"

    assert_equal expected, bot.instructions
  end
end
