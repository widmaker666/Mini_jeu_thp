require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Merde")
player2 = Player.new("Clanpin")

binding.pry
