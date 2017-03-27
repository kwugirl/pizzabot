require 'minitest/autorun'
require './pizzabot'

class PizzabotTest < Minitest::Test
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
end
