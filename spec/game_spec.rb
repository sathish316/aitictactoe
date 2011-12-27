require 'spec_helper'

describe Game do

  it "should start game with board and 2 players" do
    game = Game.new
    game.board.should_not be_nil
    game.player_one.name.should == 'X'
    game.player_two.name.should == 'O'
  end
end
