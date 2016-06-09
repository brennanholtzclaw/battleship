class CLI

  def initialize(input, printer, game)
    @input = input
    @printer = printer
    @game = game
  end

  def run
    @printer.welcome_message #welcome to battleship! Would you like to start a game?
    message_in = @input.get_input
    
    if message_in == "yes"
      @game.start_game
    elsif message_in == "instructions"
      @printer.instructions
    else
      @printer.goodbye_message
    end
  end

end
