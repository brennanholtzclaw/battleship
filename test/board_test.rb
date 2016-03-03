require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/ship'
require './lib/water'
require 'pry'

class BoardTest < Minitest::Test

  def test_board_exists
    assert Board
  end

  def test_board_accepts_a_size
    board = Board.new(7, 7)
    assert_equal 7, board.rows
    assert_equal 7, board.columns
  end

  def test_the_board_looks_like_a_grid
    board = Board.new(2, 2)

    assert_equal board.grid[0].length, 2
    assert_equal board.grid[1].length, 2
    assert_equal board.grid.length, 2
  end

  def test_board_can_hold_a_single_ship
    board = Board.new(1, 1)
    b_ship = Ship.new("battleship")

    board.set(b_ship, 1, 1)

    assert_equal b_ship, board.get(1, 1)
  end

  def test_board_can_hold_two_ships
    board = Board.new(2, 2)
    b_ship = Ship.new("battleship")
    a_ship = Ship.new("attlehip")

    board.set(b_ship, 1, 1)
    board.set(a_ship, 2, 2)

    assert_equal b_ship, board.get(1, 1)
    assert_equal a_ship, board.get(2, 2)
  end

  def test_board_can_score_a_hit_on_a_ship
    board = Board.new(2, 2)
    b_ship = Ship.new("battleship")

    board.set(b_ship, 1, 1)
    board.fire!(1, 1)

    assert b_ship.hit?
    assert b_ship.sunk?
  end

  def test_board_can_report_a_miss
    board = Board.new(1, 1)
    water = Water.new

    board.set(water, 1, 1)

    assert_nothing_raised {board.fire!(1, 1)}
  end

  def test_board_is_full_of_water_objects_at_first
    board = Board.new(2, 2)

    assert_equal Water, board.get(1,1).class
    assert_equal Water, board.get(2,2).class
  end

  def test_board_can_hold_ship_across_multiple_spaces
    board = Board.new(3, 3)
    b_ship = Ship.new("battleship", 2)

    board.set(b_ship, 1, 1)
    board.set(b_ship, 1, 2)

    assert_equal b_ship, board.get(1, 1)
    assert_equal b_ship, board.get(1, 2)

    board.fire!(1, 1)
    board.fire!(1, 2)

    assert b_ship.sunk?, "The ship was not sunk"
  end

  def test_board_can_hold_ship_across_multiple_spaces_horizontally
    board = Board.new(1, 4)
    b_ship = Ship.new("battleship", 2)

    board.place(b_ship, 1, 1)

    assert_equal b_ship, board.get(1, 1)
    assert_equal b_ship, board.get(1, 2)
    refute_equal b_ship, board.get(1, 3)
    refute_equal b_ship, board.get(1, 4)
  end

  def test_board_can_hold_ship_across_multiple_spaces_vertically
    board = Board.new(4, 1)
    b_ship = Ship.new("battleship", 2)

    board.place(b_ship, 1, 1, true)

    assert_equal b_ship, board.get(1, 1)
    assert_equal b_ship, board.get(2, 1)
    refute_equal b_ship, board.get(3, 1)
    refute_equal b_ship, board.get(4, 1)
  end

  def test_square_board_can_hold_multiple_ships_across_multiple_spaces
    board = Board.new(4, 4)
    b_ship = Ship.new("battleship", 2)
    a_ship = Ship.new("attlehip", 2)

    board.place(b_ship, 1, 1, true)
    board.place(a_ship, 4, 1, false)

    assert_equal b_ship, board.get(1, 1)
    assert_equal b_ship, board.get(2, 1)
    refute_equal b_ship, board.get(3, 1)
    refute_equal b_ship, board.get(4, 1)

    assert_equal a_ship, board.get(4, 1)
    assert_equal a_ship, board.get(4, 2)
    refute_equal a_ship, board.get(4, 3)
    refute_equal a_ship, board.get(4, 4)
  end

  private
  def assert_nothing_raised(&block)
    yield
  end
end

# def test_ship_cannot_be_placed_on_another_ship
#
# end
#
# def test_ship_cannot_be_placed_off_the_board
#
# end
  # def test_board_can_hold_ship_across_multiple_spaces_horizontally
  #   board = Board.new(3, 3)
  #   b_ship = Ship.new("battleship", 2)
  #
  #   board.set(b_ship, 1, 1)
  #   # ^need a way to indicate which direction it goes^
  #   # board.set(b_ship, 1, 1, horizontal)
  #
  #   assert_equal b_ship, board.get(1, 1)
  #   assert_equal b_ship, board.get(1, 2)
  #   refute_equal b_ship, board.get(1, 3)
  #   assert_equal Water, board.get(1, 3).class
  #   assert_equal Water, board.get(2, 1).class
  # end
  #
  # def test_board_can_hold_ship_across_multiple_spaces_vertically
  #   board = Board.new(3, 3)
  #   b_ship = Ship.new("battleship", 2)
  #
  #   board.set(b_ship, 1, 1)
  #   # ^need a way to indicate which direction it goes^
  #   # board.set(b_ship, 1, 1, vertical)
  #
  #   assert_equal b_ship, board.get(1, 1)
  #   assert_equal b_ship, board.get(2, 1)
  #   refute_equal b_ship, board.get(3, 1)
  #   assert_equal Water, board.get(1, 2).class
  #   assert_equal Water, board.get(3, 1).class
  # end
