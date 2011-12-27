class Game
  attr_reader :board, :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new("X", @board)
    @player_two = Player.new("O", @board)
  end
end
