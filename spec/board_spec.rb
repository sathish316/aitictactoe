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
  
  describe "mark" do
    it "should mark at position and return copy without modifying receiver" do
      board = Board.new
      marked_board = board.mark(1,2,'X')

      board.get(1,2).should == '.'
      marked_board.get(1,2).should == 'X'
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
      board.mark!(1,2,'X')
      board.mark!(2,1,'O')
      board.draw.should == board_output
    end
  end
  
  it "should return mark at board location" do
    board = Board.new
    board.mark!(1,2,'X')
    board.mark!(2,1,'O')

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
  
  describe "minimax value" do
    describe "completed positions" do
      it "should be +1 if favorable for MAX" do
        board = Board.new(3,[
          ['O','O','X'],
          ['X','X','X'],
          ['O','X','O']
          ])
        board.minimax('X').should == 1
      end

      it "should be 0 if favorable for neither MAX nor MIN" do
        board = Board.new(3,[
          ['O','O','X'],
          ['X','X','O'],
          ['O','X','X']
          ])
        board.minimax('X').should == 0
      end

      it "should be -1 if favorable for MIN" do
        board = Board.new(3,[
          ['O','O','X'],
          ['O','X','X'],
          ['O','X','O']
          ])
        board.minimax('X').should == -1
      end
    end
    
    describe "incomplete positions" do
      describe "player X" do
        it "should return max score of all possible moves at one level before complete position" do
          board = Board.new(3,[
            ['O','O','X'],
            ['X','X','.'],
            ['O','X','O']
            ])
          board.minimax('X').should == 1
        end

        it "should return max score of all possible moves at any level" do
          board = Board.new(3,[
            ['O','O','X'],
            ['.','X','.'],
            ['O','X','.']
            ])
          board.minimax('X').should == 0
        end
      end
      
      describe "player O" do
        it "should return min score of all possible moves at one level before complete position" do
          board = Board.new(3,[
            ['O','O','X'],
            ['.','X','X'],
            ['O','X','O']
            ])
          board.minimax('O').should == -1
        end

        it "should return min score of all possible moves at any level" do
          board = Board.new(3,[
            ['O','O','X'],
            ['X','X','.'],
            ['O','X','.']
            ])
          board.minimax('O').should == 0
        end
      end
    end 
  end
end
