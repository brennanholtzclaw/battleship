require 'minitest/autorun'
require 'minitest/emoji'
require './lib/cli'
require 'pry'

class CliGameIntegrationTest < Minitest::Test

  def test_most_basic_game_executes
    game = Minitest::Mock.new
    printer = Minitest::Mock.new
    input = Minitest::Mock.new
    cli = CLI.new(input, printer, game)
    # takes in a StringIO thing
    # a STDOUT that it prints too,
    # and a STDIN that it takes info from (StringIO)
    # `battleship.new`
    # as a mock with dependencies, it will make other mocks for us...?
    # `ruby battleship.rb`
    # BS file creates cli, game, input, and then starts the cli
    game.expect(:start_game, nil)
    # game.expect(:start_game2, nil)
    cli.run
    game.verify
    # assert_equal "Welcome to battle ship. Would you like to start a new game?"
    #
    # `yes`

    # assert_equal "board size?"
    #
    # `2`
    #
    # assert_equal "ship count?"
    #
    # `1`
    #
    # assert_equal "The game has started"
    #
    # `1, 1`
    #
    # assert_equal "Hit! You sunk my battleship!"
  end

end

# 3/14 -
# Decide whether to make this a CLI specific test or acceptance test
# Working quite a bit with mocking objects to help test to pass initially
# thing = Minitest::Mock.new
# thing.expect(:method, "expected response", [arguments for method (ie: "expected response")])
# thing.verify
#
# STDIN and STDOUT are objects that can be created inside the tests
#
# assert_equal StringIO, "You have lost the game".
#
# heredoc:
# def long_message
#   puts(<<-EOT)
#     Here goes a very long message...
#     Sincerely,
#     Dr. Foobear
#   EOT
# end
