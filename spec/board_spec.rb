require 'spec_helper'

describe Board do
  
  describe "initialize" do
    it "can be of any dimension" do
      board_output = <<-BOARD
....
....
....
....
BOARD
      board = Board.new(4)
      board.draw.should == board_output
    end
  end
  
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
      board = Board.new(3,[
        ['X','X','O'],
        ['O','X','X'],
        ['X','O','O']
        ])
      game_over, winner = board.game_status
      game_over.should be_true
      winner.should be_nil
    end
    
    it "should be true if player marks 3 consecutive positions horizontally" do
      board = Board.new(3,[
        ['.','.','.'],
        ['X','X','X'],
        ['.','.','.']
        ])
      game_over, winner = board.game_status
      game_over.should be_true
      winner.should == 'X'
    end

    it "should be true if player marks 3 consecutive positions vertically" do
      board = Board.new(3,[
        ['.','.','X'],
        ['.','.','X'],
        ['.','.','X']
        ])
      game_over, winner = board.game_status
      game_over.should be_true
      winner.should == 'X'
    end

    it "should be true if player marks 3 consecutive positions diagonally" do
      board = Board.new(3,[
        ['.','.','O'],
        ['.','O','.'],
        ['O','.','.']
        ])
      game_over, winner = board.game_status
      game_over.should be_true
      winner.should == 'O'
    end

    it "should be true if player marks 4 consecutive positions diagonally" do
      board = Board.new(4,[
        ['.','.','.','X'],
        ['.','.','X','.'],
        ['.','X','.','.'],
        ['X','.','.','.']
        ])
      game_over, winner = board.game_status
      game_over.should be_true
      winner.should == 'X'
    end

    it "should be false if there are positions to play and no 3 consecutive marks are present" do
      board = Board.new(3,[
        ['.','.','.'],
        ['.','X','.'],
        ['X','.','.']
        ])
      game_over, winner = board.game_status
      game_over.should be_false
      winner.should be_nil
    end
  end
end
