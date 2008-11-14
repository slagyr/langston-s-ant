module Earth

  prop_reader :step_button

  def scene_opened(e)
    step_button.prepare_ant    
  end

end