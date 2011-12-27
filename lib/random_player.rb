class RandomPlayer < Player
  def play
    positions = @board.empty_positions
    return if positions.empty?
    random_position = positions[rand(positions.size)]
    @board.mark(*random_position, self)
  end
end