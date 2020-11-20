require_relative "player"
require_relative "game"

def get_players
  print "Enter first player's name:\t"
  name1 = gets.chomp!

  print "\nEnter second player's name:\t"
  name2 = gets.chomp!

  if (name1 && name2)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    puts "\n------------------------------------------------------------\n\n"
    return [player1, player2]
  else
    puts "\nTwo players are required."
  end
 
end

def run_game
  players = get_players
  puts "#{players[0].name} Vs #{players[1].name}\n\n"
  puts "\n------------------------------------------------------------\n\n"
  game = Game.new(true, players[0], players[1])
  is_live = game.will_continue?
  winner = game.get_winner
  while (winner.nil? && is_live)
    game.roll_dice
    winner = game.get_winner
    is_live = game.will_continue?
  end
end

# puts "\n\nGame_Id: #{game.game_id}\n\n"
# puts "\n------------------------------------------------------------"
# game.roll_dice
# game.roll_dice
# game.roll_dice
# game.roll_dice
# game.roll_dice
# game.roll_dice
run_game
# puts "\n------------------------------------------------------------"
# game.players.each { |player| puts "\nPlayer: #{player.name}\nScore: #{player.score}\n\n" }
