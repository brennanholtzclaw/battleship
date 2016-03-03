class Ship
  attr_reader :size, :type

  def initialize(type, size=1)
    @hits = 0
    @type = type
    @size = size
  end

  def hit?
    @hits > 0
  end

  def hit!
    @hits += 1
  end

  def sunk?
    @hits >= size
  end

end

#
# class BoatSizeError < NameError
# end
# #-5 ships
#   -different sizes
#     - 5, 4, 3, 3, 2
#  - can hold hit or nothing
# - communicates whether or not it’s been hit
### - ships - could/should know/communicate location
### - placed on board in vertical or horizontal position
# 	- is sunk if all spaces have been hit(should report this)

#printer responsible for sending messages
