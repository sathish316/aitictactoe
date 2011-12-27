require 'rspec/core/rake_task'
require 'game'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

desc "Start Tic Tac Toe game"
task "game:start" do
  game = Game.new
  game.start
end