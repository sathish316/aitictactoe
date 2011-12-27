class Board
  EMPTY = '.'
  
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
  
  def game_over?
    all_x = ['X','X','X']
    all_o = ['O','O','O']
    all_rows = rows
    all_rows.any?{|row| row == all_x} || all_rows.any?{|row| row == all_o} || !has_empty_position?
  end
  
  def winner
    all_rows = rows
    all_x = ['X','X','X']
    all_o = ['O','O','O']
    return 'X' if all_rows.any?{|row| row == all_x}
    return 'O' if all_rows.any?{|row| row == all_o}
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
