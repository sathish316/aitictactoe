class Game
  attr_reader :board, :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new("X", self, @board)
    @player_two = Player.new("O", self, @board)
  end
end
