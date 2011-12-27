class AIPlayer < Player
  def play
    if name == 'X'
      best_move = @board.possible_moves.max {|move| @board.mark(*move, name).minimax('O')}
    else
      best_move = @board.possible_moves.min {|move| @board.mark(*move, name).minimax('X')}
    end
    @board.mark!(*best_move, name)
  end
end