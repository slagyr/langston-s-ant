module World

  def self.extended(prop)
    prop.world = ::World.new(100, prop)
    prop.after_painting { |pen| prop.draw_grid(pen) }
  end
  
  attr_accessor :world

  def draw_grid(pen = nil)
    pen = self.pen if pen.nil?
    area = bordered_area
    pen.color = '#bbb'
    x = 6
    99.times do |i|
      pen.draw_line(x, area.top, x, area.bottom)
      pen.draw_line(area.left, x, area.right, x)
      x += 5
    end
  end
  
  def paint_cell(x, y, color)
    area = bordered_area
    pen = self.pen
    x2 = x * 5 + 2  
    y2 = y * 5 + 2
    pen.color = color
    pen.fill_rectangle(x2, y2, 4, 4)
  end
  
end
