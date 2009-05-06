

# This is out host Monty Hall
# This Monty knows, what he is doing.
class KnowingMonty

  def to_s
    "Knowing Monty"
  end

  def initialize()
    @world = nil
  end

   def new_game(world)
    @world = world
  end

   # Monty will open a door that
   # - has no win behind it
   # - is not selected by the player
  def open_door
    save_doors = @world.doors.select { |door| not door.is_win? }
    
    save_doors = save_doors - [ @world.choosen_door ]

    my_door = save_doors[rand(save_doors.length)]
    my_door.open

  end
  
end
