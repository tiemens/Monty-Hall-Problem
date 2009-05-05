

# This is the simple. naive player that does
# not change doors between choose_door and finally_choose_door
class BasePlayer

  def to_s
    "normal player"
  end

  def initialize()
    @world = nil
  end

  def new_game(world)
    @world = world
    @choosen_door = nil
  end

  def choose_door
   @choosen_door =  @world.doors[1]
   @world.choose_door(@choosen_door)
  end

  def finally_choose_door
    @choosen_door
  end
end
