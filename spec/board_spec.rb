require 'spec_helper'

describe Board do
  describe "draw" do
    it "should draw initial board position" do
      board_output = <<-BOARD
...
...
...
BOARD
      board = Board.new
      board.draw.should == board_output
    end

    it "should draw board position with players" do
      board_output = <<-BOARD
...
..X
.O.
BOARD
      board = Board.new
      board.mark(1,2,Player.new('X',nil))
      board.mark(2,1,Player.new('O',nil))
      board.draw.should == board_output
    end
  end
  
  it "should return mark at board location" do
    board = Board.new
    board.mark(1,2,Player.new('X',nil))
    board.mark(2,1,Player.new('O',nil))

    board.get(1,2).should == 'X'
    board.get(2,1).should == 'O'
  end

  describe "game over?" do
    it "should be true if there are no more positions to play" do
      board = Board.new([
        "XXO",
        "OXX",
        "XOO"
        ])
      board.should be_game_over
      board.winner.should be_nil
    end
    
    it "should be true if player marks 3 columns horizontally" do
      board = Board.new([
        "...",
        "XXX",
        "..."
        ])
      board.should be_game_over
      board.winner.should == 'X'
    end

    it "should be true if player marks 3 columns vertically" do
      board = Board.new([
        "..X",
        "..X",
        "..X"
        ])
      board.should be_game_over
      board.winner.should == 'X'
    end

    it "should be true if player marks 3 columns diagonally" do
      board = Board.new([
        "..O",
        ".O.",
        "O.."
        ])
      board.should be_game_over
      board.winner.should == 'O'
    end

    it "should be false if there are positions to play and no 3 consecutive marks are present" do
      board = Board.new([
        "...",
        ".X.",
        "X.."
        ])
      board.should_not be_game_over
      board.winner.should be_nil
    end
  end
end
