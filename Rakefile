require 'rspec/core/rake_task'
require 'game'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

desc "Start Tic Tac Toe game with 2 Random players"
task "game:start_random" do
  game = Game.new(RandomPlayer, RandomPlayer)
  game.start
end

desc "Start Tic Tac Toe game AI vs Random player"
task "game:start_ai_vs_random" do
  game = Game.new(AIPlayer, RandomPlayer)
  game.start
end

desc "Start Tic Tac Toe game Random vs AI player"
task "game:start_random_vs_ai" do
  game = Game.new(RandomPlayer, AIPlayer)
  game.start
end

desc "Start Tic Tac Toe game with 2 AI players"
task "game:start_ai" do
  game = Game.new(AIPlayer, AIPlayer)
  game.start
end