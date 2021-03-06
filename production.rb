module Production

  def name
    return "Langton's Ant"
  end

  # Hook #1.  Called when the production is newly created, before any loading has been done.
  # This is a good place to require needed files and instantiate objects in the busines layer.
  def production_opening
    $: << File.expand_path(File.dirname(__FILE__) + "/lib")
    
    require 'world'  
  end
# 
# # Hook #2.  Called after internal gems have been loaded and stages have been instantiated, yet before
# # any scenes have been opened.
# def production_loaded
# end
# 
# # Hook #3.  Called when the production, and all the scenes, have fully opened.
# def production_opened
# end
# 
#  # The system will call this methods when it wishes to close the production, perhaps when the user quits the
#  # application.  By default the production will always return true. You may override this behavior by re-implenting
#  # the methods here.
#  def allow_close?
#    return true
#  end
#
#  # Called when the production is about to be closed.
#  def production_closing
#  end
#
#  # Called when the production is fully closed.
#  def production_closed
#  end

end
