module StartStopButton
  
  def self.extended(prop)
    prop.steps = 0
  end
  
  attr_accessor :steps
  
  def mouse_clicked(e)
    if self.text == "Start"
      self.text = "Stop"
      start
    else
      stop
      self.text = "Start"
    end
  end
  
  def start
    prepare_ant
    
    @walking = true
    @thread = Thread.new do
      walk
    end
  end
  
  def stop
    @walking = false
  end
  
  private 
  
  def prepare_ant
    if @ant.nil?
      load 'ant.rb'
      world_prop = scene.find("world")
      @ant = Ant.new(world_prop.world) if @ant.nil?
    end
  end
  
  def walk
    begin
      while @walking
        @ant.step
        @steps += 1
        update_log
        sleep(0.001)
      end
    rescue Exception => e
      puts e
      puts e.backtrace
    end
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