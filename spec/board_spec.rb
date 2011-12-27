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
      board.draw.should == board_output.chop
    end

    it "should draw board position with players" do
      board_output = <<-BOARD
...
..X
.O.
BOARD
      board = Board.new
      board.mark(1,2,Player.new('X',nil,nil))
      board.mark(2,1,Player.new('O',nil,nil))
      board.draw.should == board_output.chop
    end
  end
  
  it "should return mark at board location" do
    board = Board.new
    board.mark(1,2,Player.new('X',nil,nil))
    board.mark(2,1,Player.new('O',nil,nil))

    board.get(1,2).should == 'X'
    board.get(2,1).should == 'O'
  end

end
