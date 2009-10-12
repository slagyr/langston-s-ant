#- Copyright 2008 8th Light, Inc. All Rights Reserved.
#- Limelight and all included source files are distributed under terms of the GNU LGPL.

description_text = <<END
The Rules:

If the ant is on a black dot, paint it white and go right.

If the ant is on a white dot, paint it black and go left.
END

__ :name => "earth"
title :text => "Langton's Ant"
left_col do
  description :text => description_text
  log :id => "log" do
    moves_label :text => "Moves:"
    moves_counter :id => "count", :text => "# of moves"
    location_label :text => "Location:"
    location :id => "location", :text => "???"
  end
  start_stop_button :text => "Start", :players => "button"
end
world :id => "world"
