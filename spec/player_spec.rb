require 'spec_helper'

describe Player do
  it "should initialize player" do
    player = Player.new("Max", Board.new)
    player.name.should == 'Max'
  end
end
