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
end
