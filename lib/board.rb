require_relative 'water'

class Board
  attr_reader :rows, :columns, :grid

  def initialize(length, width)
    @rows = length
    @columns = width
    @grid = Array.new(rows) {Array.new(columns, Water.new)}
  end

  def set(ship, x, y)
    @grid[x-1][y-1] = ship
  end

  def get(x, y)
    @grid[x-1][y-1]
  end

  def place(ship, x, y, vertical=false)
    if vertical
      for i in 0...ship.size
        @grid[x + i - 1][y-1] = ship
      end
    else
      for i in 0...ship.size
        @grid[x-1][y + i - 1] = ship
      end
    end
  end

  def fire!(x,y)
    get(x,y).hit!
  end

end

# 03/02
# Board seems to be well tested - time to move to the next level up?

# 2/17
# Board should be able to hold one ship across multiple spaces
# can we hit a ship from the board?

# -board
###know where ships are
#  - home-board 8x8 grid
#   - can hold nothing or ships in grid spaces
#   -hit/miss - history board
#  -board should keep track of misses
