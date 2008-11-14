module Log

  def self.extended(prop)
  end

  def update_counter(steps)
    count.text = steps.to_s
  end

  def update_location(coords)
    location.text = coords.to_s
  end

  def count
    @count = scene.find("count") if not @count
    return @count
  end

  def location
    @location = scene.find("location") if not @location
    return @location
  end

end