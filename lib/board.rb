class Board
  EMPTY = '.'
  X = 'X'
  O = 'O'
  
  def initialize(size=3, board=nil)
    @size = size
    @board = board || empty_board
    @all_x = Array.new(@size).fill(X)
    @all_o = Array.new(@size).fill(O)
  end
  
  def mark(x,y,player)
    @board[x][y] = player.name
  end
  
  def get(x,y)
    @board[x][y]
  end
  
  def draw
    output = ""
    @size.times do |i|
      @size.times do |j|
        output << @board[i][j]
      end
      output << "\n"
    end
    output
  end
  
  def game_status
    all_rows = rows
    won_by_x = all_rows.any?{|row| row == @all_x}
    won_by_o = all_rows.any?{|row| row == @all_o}
    [
      (won_by_x || won_by_o || !has_empty_position?), 
      (won_by_x ? X : (won_by_o ? O : nil))
    ]
  end
  
  def empty_positions
    positions = []
    @size.times do |i|
      @size.times do |j|
        positions << [i,j] if @board[i][j] == EMPTY
      end
    end
    positions
  end
  
  private
  
  def empty_board
    board = []
    @size.times { board << Array.new(@size).fill(EMPTY) }
    board
  end
  
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
    main_diagonal = (0...@size).map {|i| @board[i][i]}
    alternate_diagonal = (0...@size).map {|i| @board[i][@size-1-i]}
    [main_diagonal, alternate_diagonal]
  end
end
