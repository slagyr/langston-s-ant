# 2 hours

require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'ant'
require 'world'

describe Ant do
  
  before(:each) do
    @world = World.new(10)
    @ant = Ant.new(@world)
  end
  
  it "should start in the middle of the world" do
    @ant.world.should == @world
    @ant.x.should == 5
    @ant.y.should == 5
  end
  
  it "should take a step" do
    @ant.step
    
    @world.is_black?(5, 5).should == true
    @ant.location.should == [4, 5]
  end
  
  it "should take two steps" do
    @ant.step
    @ant.step
    
    @world.is_black?(4, 5).should == true
    @ant.location.should == [4, 4]
  end

  it "should take 3 steps" do
    3.times { @ant.step }

    @world.is_black?(4, 4).should == true
    @ant.location.should == [5, 4]
  end

  it "should take 4 steps" do
    4.times { @ant.step }

    @world.is_black?(5, 4).should == true
    @ant.location.should == [5, 5]
  end

  it "should take 5 steps" do
    5.times { @ant.step }

    @world.is_black?(5, 5).should == false
    @ant.location.should == [6, 5]
  end

  it "should take 6 steps" do
    6.times { @ant.step }

    @world.is_black?(6, 5).should == true
    @ant.location.should == [6, 6]
  end

  it "should take 7 steps" do
    7.times { @ant.step }

    @world.is_black?(6, 6).should == true
    @ant.location.should == [5, 6]
  end

  it "should take 8 steps" do
    8.times { @ant.step }

    @world.is_black?(5, 6).should == true
    @ant.location.should == [5, 5]
  end

  it "should take 9 steps" do
    9.times { @ant.step }

    @world.is_black?(5, 5).should == true
    @ant.location.should == [6, 5]
  end
  
  it "should take 10 steps" do
    10.times { @ant.step }

    @world.is_black?(6, 5).should == false
    @ant.location.should == [6, 4]
  end
  
  it "should take 11 steps" do
    11.times { @ant.step }

    @world.is_black?(6, 4).should == true
    @ant.location.should == [7, 4]
  end
  
  it "should take 14 steps" do
    14.times { @ant.step }

    @ant.location.should == [6, 4]
  end
  
  it "should take 15 steps" do
    15.times { @ant.step }

    @world.is_black?(6, 4).should == false
    @ant.location.should == [5, 4]
  end
  
  it "should take 16 steps" do
    16.times { @ant.step }

    @world.is_black?(5, 4).should == false
    @ant.location.should == [5, 5]
  end
  
  it "should warp around world when going west" do
    @ant.location = [0, 0]
    @ant.step
    
    @ant.location.should == [9, 0]
  end
  
  it "should warp around world when going north" do
    @ant.location = [0, 9]
    @ant.direction = :east
    @ant.step
    
    @ant.location.should == [0, 0]
  end
  
  it "should warp around world when going south" do
    @ant.location = [0, 0]
    @ant.direction = :west
    @ant.step
    
    @ant.location.should == [0, 9]
  end
  
  it "should warp around world when going west" do
    @ant.location = [9, 0]
    @ant.direction = :south
    @ant.step
    
    @ant.location.should == [0, 0]
  end
end
