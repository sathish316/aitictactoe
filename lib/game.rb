require 'board'
require 'player'
require 'random_player'
require 'ai_player'

class Game
  attr_reader :board, :players

  def initialize(player_one_klass, player_two_klass)
    @board = Board.new
    @players = [player_one_klass.new("X", @board), player_two_klass.new("O", @board)]
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