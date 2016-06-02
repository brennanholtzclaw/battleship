class CLI

  def initialize(input, printer, game)
    @input = input
    @printer = printer
    @game = game
  end

  def run
    @game.start_game
  end
end
