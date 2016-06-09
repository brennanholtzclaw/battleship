require 'minitest/autorun'
require 'minitest/emoji'
require './lib/cli'
require './lib/printer'
require './lib/input'
require './lib/game'
require 'pry'
require 'mocha/mini_test'

class CliGameIntegrationTest < Minitest::Test
  def setup
    @game = Game.new
    @printer = Printer.new
    @input = Input.new
    @cli = CLI.new(@input, @printer, @game)
  end

  def teardown
    # @game.verify
    # @printer.verify
    # @input.verify
  end

  def test_most_basic_game_executes
    # takes in a StringIO thing
    # a STDOUT that it prints too,
    # and a STDIN that it takes info from (StringIO)
    # `battleship.new`
    # as a mock with dependencies, it will make other mocks for us...?
    # `ruby battleship.rb`
    # BS file creates cli, game, input, and then starts the cli
    @printer.expects(:welcome_message).returns(nil).once
    @input.expects(:get_input).returns("yes").once
    @game.expects(:start_game).returns(nil).once

    @cli.run
  end

  def test_user_can_quit_before_starting_game
    @printer.expect(:welcome_message, nil)
    @input.expect(:get_input, "quit")
    @printer.expect(:goodbye_message, nil)

    @cli.run
  end

  def test_user_can_read_instructions
    @printer.expect(:welcome_message, nil)
    1.times {@input.expect(:get_input, "instructions")}
    @printer.expect(:instructions, nil)
    1.times {@input.expect(:get_input, "quit")}
    @printer.expect(:goodbye_message, nil)

    @cli.run
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
