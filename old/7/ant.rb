class Ant

  North = "@y += 1"
  East = "@x += 1"
  South = "@y -= 1"
  West = "@x -= 1"
  Compass = [North, East, South, West]

  def initialize(world)
    @world = world
    @x = @y = world.size / 2
    @direction = 0
  end

  def location
    return @x, @y
  end

  def location=(coordinates)
    @x = coordinates[0]
    @y = coordinates[1]
  end

  def direction
    return Compass[@direction]
  end

  def direction=(value)
    @direction = Compass.index(value)
  end

  def step
    if @world.is_black?(@x, @y)
      @world.paint_white(@x, @y)
      turn_right
    else
      @world.paint_black(@x, @y)
      turn_left
    end

    self.instance_eval(Compass[@direction])

    @y = warp_if_needed(@y)
    @x = warp_if_needed(@x)
  end

  private #################################################

  def warp_if_needed(value)
    return 0 if value >= @world.size
    return @world.size - 1 if value < 0
    return value
  end

  def turn_right
    @direction = (@direction + 1) % 4
  end

  def turn_left
    @direction = (@direction - 1) % 4
  end

end