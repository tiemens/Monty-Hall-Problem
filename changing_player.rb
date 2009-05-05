# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'base_player.rb'


# This is the player with math skills  that does
#  change doors between choose_door and finally_choose_door
class ChangingPlayer < BasePlayer

  def to_s
    "clever player"
  end

   def finally_choose_door
    door = @world.all_closed_doors.find() { |p| p !=  @choosen_door }
    door
  end
end
