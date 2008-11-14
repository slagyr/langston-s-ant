class World
  
  def initialize(size, screen = nil)
    @size = size
    @screen = screen
    @cells = []
    size.times { @cells << Array.new(size, false) }
  end
  
  def size
    return @size
  end
  
  def black?(x, y)
    return @cells[x][y]
  end
  
  def paint_black(x, y)
    @cells[x][y] = true
    @screen.paint_cell(x, y, "black") if @screen
  end
  
  def paint_white(x, y)
    @cells[x][y] = false
    @screen.paint_cell(x, y, "white") if @screen
  end

  def black!
    @size.times do |x|
      @size.times do |y|
        paint_black(x, y)
      end
    end
  end
  
end