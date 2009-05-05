# To change this template, choose Tools | Templates
# and open the template in the editor.


# Collect statistics for a player. Counts the numer of won/lost games
class Statistics
  attr_reader  :player, :games_won, :games_lost
   def initialize(player)
      @player = player
      @games_won = 0
      @games_lost = 0
   end

   def record_game(has_won)
     if has_won then
       @games_won += 1
     else
       @games_lost += 1
     end
   end

   def total_games
     @games_won + @games_lost
   end
end