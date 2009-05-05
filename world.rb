
class Door
  def is_open?
    @is_open
  end

  def is_win?
    @is_win
  end

  def initialize(is_win)
    @is_open = false
    @is_win = is_win
  end

  def open
    @is_open = true
  end
end

# the world represents the current state of the game
class World

  # All doors
  attr_reader :doors
  
  # The door that the player has choosen
  attr_reader  :choosen_door


  # The player calls this method to select
  # a door before Monty selects his door
  def choose_door(door)
  @choosen_door = door
  end

  def all_closed_doors
    @doors.select { |e| not e.is_open?  }
  end

  def all_open_doors
    @doors.select { |e|  e.is_open?  }
  end

  # Has the player won this game (is a door with a price open)?
  def has_player_won?
    all_open_doors().find_all { |door| door.is_win?  }.length > 0
  end

  #
  def initialize(num_doors)
    doors = []
    (1..num_doors-1).each { |i| doors << Door.new( false)  }
    doors << Door.new( true)

    @doors = doors.sort_by { rand }
  end



end


