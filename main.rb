require 'world.rb'
require 'statistics.rb'

require 'knowing_monty.rb'
require 'un_knowing_monty.rb'


require 'base_player.rb'
require 'changing_player.rb'
require 'cheating_player.rb'



# This class simulates the "Monty Hall" effect.
# 
# To quote from http://en.wikipedia.org/wiki/Monty_Hall_problem
#     Suppose you're on a game show, and you're given the choice of
#     three doors: Behind one door is a car; behind the others,
#     goats.
#     You pick a door, say No. 1, and the host, who knows what's
#     behind the doors, opens another door, say No. 3, which has
#     a goat.
#     He then says to you, "Do you want to pick door No. 2?"
#     Is it to your advantage to switch your choice?
#
# Surprisingly *it does matter*, if you choose the other door.
#
# Oscar Bonilla explains this result on his web page:
# http://oscarbonilla.com/2009/05/the-monty-hall-problem/
#
# For all those that do not trust math, I wrote a small programm.
#
# This class allows several Players to compete against each other.
# They all have several chances to play against Monty Hall,
# each won game is counted. The winner is the player with the most
# wins.
class Game

  # Our statistics
  attr_reader :stats, :num_of_doors_in_this_world, :monty
  
  def initialize(monty, num_games_to_play, num_of_doors_in_this_world )
    @stats = {}
    
    @monty = monty
    @num_of_doors_in_this_world = num_of_doors_in_this_world
    @num_games = num_games_to_play
  end


  # Test a player by letting him play against
  # Monty for a few times. Records the statistics
  def test_player(player)
    s =  Statistics.new(player)
    
    @stats[player] = s

    (1..@num_games).each do
      |i|

      has_won = play(player)
      s.record_game(has_won)
    end
  end

  # Play a single game. The rules are
  # The player chooses a door
  # Then Monty opens a door. Monty will
  #  - not open a door with a prize
  #  - not open the door the player has choosen
  #
  # After Monty has made his move, the player finally
  # opens a door.
  #
  # the method returns whether the player has won
  # this round.
def play(player)
  world = World.new(@num_of_doors_in_this_world)

  player.new_game(world)
  @monty.new_game(world)

  player.choose_door()
  @monty.open_door()
  
  players_door = player.finally_choose_door()
  players_door.open

  return players_door.is_win?

end

end

[UnKnowingMonty.new, KnowingMonty.new].each do
    |monty|


    puts "\n\n-----------------"
    puts ""
    puts "  I am your host for today: #{monty}"
    puts ""
    puts "-----------------\n\n"
    
    (3..4).each do
      |num_doors|

      game = Game.new(monty, 10000, num_doors)

      game.test_player(BasePlayer.new)
      game.test_player(ChangingPlayer.new)
      game.test_player(CheatingPlayer.new)

      ranking = game.stats.values.sort{ |s1, s2| s2.games_won <=> s1.games_won }

      puts "\tIn a world with #{game.num_of_doors_in_this_world} doors the following players have won:"
      ranking.each do | stats |
        puts "\t\t #{stats.player} \thas won   #{stats.games_won} games (   #{ (100 * stats.games_won / stats.total_games)}  %)"
      end
      puts "\n\t-----------------\n"
  end
end