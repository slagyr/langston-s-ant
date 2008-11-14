require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'world'
require 'ant'

describe Ant do

  before(:each) do
    @world = World.new(10)
    @ant = Ant.new(@world)
  end

  it "should start in the center of the world" do
    @ant.location.should == [5, 5]
  end

  it "should take one step" do
    @ant.step

    @world.black?(5, 5).should == true
    @ant.location.should == [4, 5]
  end

  it "should take 2 steps" do
    2.times { @ant.step }

    @world.black?(4, 5).should == true
    @ant.location.should == [4, 4]
  end

  it "should take 3 steps" do
    3.times { @ant.step }

    @world.black?(4, 4).should == true
    @ant.location.should == [5, 4]
  end

  it "should take 4 steps" do
    4.times { @ant.step }

    @world.black?(5, 4).should == true
    @ant.location.should == [5, 5]
  end

  it "should take 4 steps in a world painted black" do
    @world.black!
    4.times { @ant.step }

    @world.black?(5, 5).should == false
    @world.black?(6, 5).should == false
    @world.black?(6, 4).should == false
    @world.black?(5, 4).should == false
    @ant.location.should == [5, 5]
  end

  it "should warp horizontally" do
    @ant.location = [0, 5]

    @ant.step

    @ant.location.should == [9, 5]
  end

  it "should warp vertically" do
    @ant.location = [5, 9]
    @ant.direction = 1

    @ant.step

    @ant.location.should == [5, 0]
  end

end