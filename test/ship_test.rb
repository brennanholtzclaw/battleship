require 'minitest/autorun'
require 'minitest/emoji'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_the_ship_class_exists
    assert Ship
  end

  def test_ship_has_a_type
    ship = Ship.new("Battle Ship")

    assert_equal "Battle Ship", ship.type
  end

  def test_that_a_new_ship_has_not_been_hit
    ship = Ship.new("Battle Ship")

    refute ship.hit?, "This ship was hit"
  end

  def test_ship_can_be_hit
    ship = Ship.new("Battle Ship")

    ship.hit!

    assert ship.hit?, "The ship was not hit"
  end

  def test_ship_remains_hit_after_multiple_hits
    ship = Ship.new("Battle Ship")

    ship.hit!
    ship.hit!

    assert ship.hit?, "The ship was not hit"
  end

  def test_ship_has_a_size
    ship = Ship.new("Battle Ship", 4)

    assert_equal 4, ship.size
  end

  def test_ships_size_must_be_provided_or_defaults_to_one
    ship = Ship.new("Battle Ship")

    assert_equal 1, ship.size
  end

  def test_can_be_sunk
    ship = Ship.new("Battle Ship", 1)

    refute ship.sunk?, "The ship is sunk"
    ship.hit!

    assert ship.sunk?, "The ship is not sunk"
  end

  def test_can_a_larger_ship_be_sunk
    ship = Ship.new("Battle Ship", 3)

    ship.hit!
    ship.hit!
    refute ship.sunk?, "The ship is sunk"
    ship.hit!

    assert ship.sunk?, "The ship is not sunk"
  end

  def test_can_be_hit_after_sunk
    ship = Ship.new("Battle Ship", 3)

    ship.hit!
    ship.hit!
    ship.hit!
    ship.hit!

    assert ship.sunk?, "The ship is not sunk"
  end

end
