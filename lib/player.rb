class Player
  attr_reader :name
  
  def initialize(name, board)
    @name = name
    @board = board
  end
  
  def play
    positions = @board.empty_positions
    return if positions.empty?
    random_position = positions[rand(positions.size)]
    @board.mark(*random_position, self)
  end
end
