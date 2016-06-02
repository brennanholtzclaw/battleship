require 'minitest/autorun'
require 'minitest/emoji'
require './lib/board'
require './lib/ship'
require './lib/water'
require 'pry'

class GameTest < Minitest::Test

  private
  def assert_nothing_raised(&block)
    yield
  end
end


# 3/14 - Main function 'win condition'?
#  - Should be able to tell it to start a Game
    # -give it board size?
    # -give it ship numbers/size?
# - Has a predetermined number/size/names set of ships?

# CLI could be used for customizing values on board and for ships
