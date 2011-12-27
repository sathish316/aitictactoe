class Player
  attr_reader :name
  
  def initialize(name, game, board)
    @name = name
    @game = game
    @board = board
  end
end
