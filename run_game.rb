require_relative "player"
require_relative "game"

player1 = Player.new("Sanjib")
player2 = Player.new("Reettik")

game = Game.new(true, player1, player2)
puts "\n\nGame_Id: #{game.game_id}\n\n"
puts "\n------------------------------------------------------------"
game.roll_dice
game.roll_dice
game.roll_dice
game.roll_dice
game.roll_dice
game.roll_dice
puts "\n------------------------------------------------------------"
game.players.each {|player| puts "\nPlayer: #{player.name}\nScore: #{player.score}\n\n"}