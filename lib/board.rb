class Board
  def initialize
    @board = ["...","...","..."]
  end
  
  def mark(x,y,player)
    @board[x][y] = player.name
  end
  
  def get(x,y)
    @board[x][y]
  end
  
  def draw
    @board.join("\n")
  end
end
