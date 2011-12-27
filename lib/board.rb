class Board
  EMPTY = '.'
  X = 'X'
  O = 'O'
  
  def initialize(size=3, board=nil, all_x=nil, all_o=nil)
    @size = size
    @board = board || empty_board
    @all_x = all_x || Array.new(@size).fill(X)
    @all_o = all_o || Array.new(@size).fill(O)
  end
  
  def mark(x,y,player_name)
    cloned_cells = @board.map{|row| row.clone}
    cloned_board = Board.new(@size, cloned_cells, @all_x, @all_o)
    cloned_board.mark!(x,y,player_name)
    cloned_board
  end
  
  def mark!(x,y,player_name)
    @board[x][y] = player_name
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
    won_by_x = all_rows.include?(@all_x)
    won_by_o = all_rows.include?(@all_o)
    [
      (won_by_x || won_by_o || !has_empty_position?), 
      (won_by_x ? X : (won_by_o ? O : nil))
    ]
  end

  def minimax(player_name)
    game_over, winner = game_status
    if game_over
      return 1 if winner == X
      return -1 if winner == O
      return 0
    else
      if(player_name == X)
        possible_moves.map {|move| self.mark(*move, player_name).minimax(O)}.max
      else
        possible_moves.map {|move| self.mark(*move, player_name).minimax(X)}.min
      end
    end
  end
  
  def possible_moves
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
