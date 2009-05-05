# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'base_player.rb'


# He cheats!
class CheatingPlayer < BasePlayer

  def to_s
    "cheating player"
  end

   def finally_choose_door
     door = @world.doors.find() { |p| p.is_win? }
     door
  end
end
