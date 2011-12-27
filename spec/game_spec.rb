require 'spec_helper'

describe Game do

  it "should start game with board and 2 players" do
    game = Game.new
    game.board.should_not be_nil
    game.player_one.should_not be_nil
    game.player_two.should_not be_nil
  end

end
