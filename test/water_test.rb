require 'minitest/autorun'
require 'minitest/emoji'
require './lib/water'
require 'pry'

class WaterTest < Minitest::Test

  def test_water_exists
    assert Water
  end

  def test_water_can_be_hit
    water = Water.new

    assert_respond_to water, :hit!
  end

end
