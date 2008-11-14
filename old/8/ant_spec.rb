require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'ant'
require 'world'

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

    @world.is_black?(5, 5).should == true
    @ant.location.should == [4, 5]
  end

  it "should take 2 steps" do
    2.times { @ant.step }

    @world.is_black?(4, 5)
    @ant.location.should == [4, 4]
  end

  it "should take 3 steps" do
    3.times { @ant.step }

    @world.is_black?(4, 4)
    @ant.location.should == [5, 4]
  end


  it "should take 4 steps" do
    4.times { @ant.step }

    @world.is_black?(5, 4)
    @ant.location.should == [5, 5]
  end

  it "should step 4 time in a world of size 6" do
    @world = World.new(6)
    @ant = Ant.new(@world)

    4.times { @ant.step }

    @ant.location.should == [3, 3]
    @world.is_black?(3, 3).should == true
    @world.is_black?(2, 3).should == true
    @world.is_black?(2, 2).should == true
    @world.is_black?(3, 2).should == true
  end

  def paint_it_black(world)
    world.size.times do |i|
      world.size.times do |j|
        world.paint_black(i, j)
      end
    end
  end

  it "should take one step in a world painted black" do
    paint_it_black(@world)

    @ant.step

    @ant.location.should == [6, 5]
    @world.is_black?(5, 5).should == false
  end


  it "should take 2 steps in a world painted black" do
    paint_it_black(@world)

    2.times { @ant.step }

    @ant.location.should == [6, 4]
    @world.is_black?(6, 5).should == false
  end

  it "should take 3 steps in a world painted black" do
    paint_it_black(@world)

    3.times { @ant.step }

    @ant.location.should == [5, 4]
    @world.is_black?(6, 4).should == false
  end



  it "should take 4 steps in a world painted black" do
    paint_it_black(@world)

    4.times { @ant.step }

    @ant.location.should == [5, 5]
    @world.is_black?(6, 4).should == false
  end

  it "should warp north" do
    @ant.location = [5, 9]
    @ant.direction = :east

    @ant.step

    @ant.location.should == [5, 0]
  end


  it "should warp south" do
    @ant.location = [5, 0]
    @ant.direction = :west

    @ant.step

    @ant.location.should == [5, 9]
  end




  it "should east south" do
    @ant.location = [0, 5]
    @ant.direction = :north

    @ant.step

    @ant.location.should == [9, 5]
  end


  it "should warp west" do
    @ant.location = [9, 5]
    @ant.direction = :south

    @ant.step

    @ant.location.should == [0, 5]
  end



end