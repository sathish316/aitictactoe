require 'rspec/core/rake_task'
require 'game'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

desc "Start Tic Tac Toe game with 2 Random players"
task "game:start_random" do
  game = Game.new(RandomPlayer, RandomPlayer)
  game.start
end

desc "Start Tic Tac Toe game with AI and Random player"
task "game:start_ai_random" do
  game = Game.new(AIPlayer, RandomPlayer)
  game.start
end

desc "Start Tic Tac Toe game with 2 AI players"
task "game:start_ai" do
  game = Game.new(AIPlayer, AIPlayer)
  game.start
end