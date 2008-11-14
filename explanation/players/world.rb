module World

  def self.extended(prop)
    prop.world = ::World.new(10, prop)
    prop.after_painting { |pen| prop.draw_grid(pen) }
  end

  attr_accessor :world

  def draw_grid(pen = nil)
    pen = self.pen if pen.nil?
    area = bordered_area
    pen.color = '#bbb'
    x = 51
    9.times do |i|
      pen.draw_line(x, area.top, x, area.bottom)
      pen.draw_line(area.left, x, area.right, x)
      x += 50
    end

    pen.smooth = true
    pen.color = "green"
    pen.fill_oval(262, 212, 30, 30)
  end

  def paint_cell(x, y, color)
    area = bordered_area
    pen = self.pen
    x2 = x * 50 + 2
    y2 = (454 - (y * 50 + 2))
    pen.color = color
    pen.fill_rectangle(x2, y2, 49, 49)
  end

  def locate_ant(coords)
    x = coords[0]
    y = coords[1]
    x2 = x * 50 + 12
    y2 = (454 - (y * 50 - 8))
    pen = self.pen
    pen.smooth = true
    pen.color = "green"
    pen.fill_oval(x2, y2, 30, 30)
  end

  def paint_it_black
    world.size.times do |x|
      world.size.times do |y|
        world.paint_black(x, y)
        paint_cell(x, y, "black")
      end
    end
    locate_ant(scene.find('step_button').ant.location)
  end

end
