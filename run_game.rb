require_relative "player"
require_relative "game"

player1 = Player.new("Sanjib")
player2 = Player.new("Reettik")

game = Game.new(true, player1, player2)
puts "Game_Id: #{game.game_id}"
game.players.each {|player| puts player.player_id}