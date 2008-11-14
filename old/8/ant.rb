class Ant

  attr_accessor :direction

  def initialize(world)
    @x = @y = world.size / 2
    @world = world
    @direction = :north
  end

  def location
    return [@x, @y]
  end

  def location=(coordinates)
    @x = coordinates[0]
    @y = coordinates[1]
  end

  def step
    if @world.is_black?(@x, @y)
      @world.paint_white(@x, @y)
      turn_right
    else
      @world.paint_black(@x, @y)
      turn_left
    end

    @y = warp_if_needed(@y)
    @x = warp_if_needed(@x)
  end

  private ######################################

  def warp_if_needed(value)
    return 0 if value >= @world.size
    return @world.size - 1 if value < 0
    return value
  end

  def turn_right
    case @direction
    when :north
      go_east
    when :east
      go_south
    when :south
      go_west
    when :west
      go_north
    end
  end

  def turn_left
    case @direction
    when :north
      go_west
    when :west
      go_south
    when :south
      go_east
    when :east
      go_north
    end
  end

  def go_east
    @x += 1
    @direction = :east
  end

  def go_south
    @y -= 1
    @direction = :south
  end

  def go_west
    @x -= 1
    @direction = :west
  end

  def go_north
    @y += 1
    @direction = :north
  end

end