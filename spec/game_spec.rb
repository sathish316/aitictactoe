require 'spec_helper'

describe Game do

  it "should start game with board and 2 players" do
    game = Game.new
    game.board.should_not be_nil
    game.players[0].name.should == 'X'
    game.players[1].name.should == 'O'
  end
end
