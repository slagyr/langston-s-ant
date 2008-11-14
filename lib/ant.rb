class Ant

  NORTH = "@y += 1"
  EAST = "@x += 1"
  SOUTH = "@y -= 1"
  WEST = "@x -= 1"
  COMPASS = [NORTH, EAST, SOUTH, WEST]

  attr_accessor :direction

  def initialize(world)
    @world = world
    @x = @y = @world.size / 2
    @direction = 0
  end

  def location
    return @x, @y
  end

  def location=(coordinates)
    @x = coordinates[0]
    @y = coordinates[1]
  end

  def step
    if @world.black?(@x, @y)
      @world.paint_white(@x, @y)
      @direction = (@direction + 1) % 4
    else
      @world.paint_black(@x, @y)
      @direction = (@direction - 1) % 4
    end

    instance_eval(COMPASS[@direction])

    @x %= @world.size
    @y %= @world.size
  end

end