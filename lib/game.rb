require File.expand_path('../board', __FILE__)
require File.expand_path('../player', __FILE__)

class Game
  attr_reader :board, :players

  def initialize
    @board = Board.new
    @players = [Player.new("X", @board), Player.new("O", @board)]
  end
  
  def start
    count = 0
    begin
      @players[count%2].play
      draw
      game_over, winner = @board.game_status
      count += 1
    end until game_over
    puts "Winner: #{winner || 'None'}"
  end
  
  def draw
    system('clear')
    puts @board.draw
    sleep(1)
  end
end