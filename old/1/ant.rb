class Ant
  
  attr_reader :x, :y, :world
  attr_accessor :direction
  
  def initialize(world)
    @world = world
    @x = @y = @world.size / 2
    @direction = :north
  end
  
  def location
    return x, y
  end
  
  def location=(coordinates)
    @x = coordinates[0]
    @y = coordinates[1]
  end
  
  def step
    if @world.is_black?(x, y)
      @world.paint_white(x, y)
      go_right
    else
      @world.paint_black(x, y)
      go_left
    end
    warp_if_needed
  end
  
  private
  
  def warp_if_needed
    @x = @world.size - 1 if @x < 0
    @y = @world.size - 1 if @y < 0
    @x = 0 if @x >= @world.size
    @y = 0 if @y >= @world.size
  end
  
  def go_right
    if @direction == :north
      @x += 1
      @direction = :east
    elsif @direction == :east
      @y -= 1
      @direction = :south
    elsif @direction == :south
      @x -= 1
      @direction = :west
    elsif @direction == :west
      @y += 1
      @direction = :north
    end
  end
  
  def go_left
    if @direction == :north
      @x -= 1
      @direction = :west
    elsif @direction == :west
      @y -= 1
      @direction = :south
    elsif @direction == :south
      @x += 1
      @direction = :east
    elsif @direction == :east
      @y += 1
      @direction = :north
    end
  end
  
end
