require 'spec_helper'

describe Game do
  describe "initialize" do
    it "should start game with board and 2 players" do
      game = Game.new
      game.board.should_not be_nil
      game.players[0].name.should == 'X'
      game.players[1].name.should == 'O'
    end

    it "should start game with customized player types" do
      game = Game.new(AIPlayer, RandomPlayer)
      game.board.should_not be_nil
      game.players[0].class.should == AIPlayer
      game.players[1].class.should == RandomPlayer
    end
  end
end
