module StepButton

  attr_accessor :steps, :ant

  def mouse_clicked(e)
    @ant.step
    @steps += 1
    @world.locate_ant(@ant.location)
    update_log
  end

  def prepare_ant
    @steps = 0
    require 'slow_ant'
    @world = scene.find("world")
    @ant = SlowAnt.new(@world.world) if @ant.nil?
  end

  def log
    @log = scene.find("log") if @log.nil?
    return @log
  end

  def update_log
    log.count.text = @steps
    log.location.text = @ant.location.join(', ')
  end

end