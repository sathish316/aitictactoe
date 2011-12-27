class Board
  EMPTY = '.'
  X = 'X'
  O = 'O'
  ALL_X = [X,X,X]
  ALL_O = [O,O,O]
  
  def initialize(board=["...","...","..."])
    @board = board.map {|row| row.chars.to_a}
  end
  
  def mark(x,y,player)
    @board[x][y] = player.name
  end
  
  def get(x,y)
    @board[x][y]
  end
  
  def draw
    output = ""
    3.times do |i|
      3.times do |j|
        output << @board[i][j]
      end
      output << "\n"
    end
    output
  end
  
  def game_status
    all_rows = rows
    won_by_x = all_rows.any?{|row| row == ALL_X}
    won_by_o = all_rows.any?{|row| row == ALL_O}
    [
      (won_by_x || won_by_o || !has_empty_position?), 
      (won_by_x ? X : (won_by_o ? O : nil))
    ]
  end
  
  def empty_positions
    positions = []
    3.times do |i|
      3.times do |j|
        positions << [i,j] if @board[i][j] == EMPTY
      end
    end
    positions
  end
  
  private
  
  def has_empty_position?
    @board.flatten.include?(EMPTY)
  end
  
  def rows
    horizontals + verticals + diagonals
  end
  
  def horizontals
    @board
  end
  
  def verticals
    @board.transpose
  end
  
  def diagonals
    [
      [@board[0][0], @board[1][1], @board[2][2]],
      [@board[0][2], @board[1][1], @board[2][0]],
    ]
  end
end
