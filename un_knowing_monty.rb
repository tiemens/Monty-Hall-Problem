

# This is out host Monty Hall
# This Monty does not know, what he is doing.
# 
class UnKnowingMonty

  def to_s
    "ÚnKnowing Monty"
  end

  def initialize()
    @world = nil
  end

   def new_game(world)
    @world = world
  end

   # Monty will open a door that
   # - ignores any knowledge he might have
   #   about a proce behind the door
   # - is not selected by the player
  def open_door

    
    save_doors = @world.doors - [ @world.choosen_door ]

    my_door = save_doors[rand(save_doors.length)]
    my_door.open

  end
  
end
