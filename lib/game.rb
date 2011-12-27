require File.expand_path('../board', __FILE__)
require File.expand_path('../player', __FILE__)

class Game
  attr_reader :board, :player_one, :player_two

  def initialize
    @board = Board.new
    @player_one = Player.new("X", @board)
    @player_two = Player.new("O", @board)
  end
  
  def start
    begin
      @player_one.play
      draw
      @player_two.play
      draw
      game_over, winner = @board.game_status
      sleep(1)
    end until game_over
    puts "Winner: #{winner || 'None'}"
  end
  
  def draw
    system('clear')
    puts @board.draw
  end
end

# game = Game.new
# game.start