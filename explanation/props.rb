#- Copyright 2008 8th Light, Inc. All Rights Reserved.
#- Limelight and all included source files are distributed under terms of the GNU LGPL.

description_text = <<END
The Rules:

If the ant is on a black dot, paint it white and go right.

If the ant is on a white dot, paint it black and go left.
END

__ :name => "earth"
title :text => "Langton's Ant Example"
left_col do
  description :text => description_text
  log :id => "log" do
    moves_label :text => "Moves:"
    moves_counter :id => "count", :text => "# of moves"
    location_label :text => "Location:"
    location :id => "location", :text => "???"
  end
  buttons do
    step_button :text => "Step", :players => "button", :id => "step_button"
    black_button :text => "Go Black", :players => "button", :on_mouse_clicked => "scene.find('world').paint_it_black", :width => 100
  end
  go_link :text => "Go to Real Langton's Ant", :on_mouse_clicked => "scene.load('langtons_ant')"
end
world :id => "world"