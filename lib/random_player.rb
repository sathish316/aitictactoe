class RandomPlayer < Player
  def play
    positions = @board.possible_moves
    return if positions.empty?
    random_position = positions[rand(positions.size)]
    @board.mark!(*random_position, self.name)
  end
end