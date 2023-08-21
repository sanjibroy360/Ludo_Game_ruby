require_relative "player"
require_relative "game"

def separate_by_dash
    return puts "\n------------------------------------------------------------\n\n"
end

def get_players
  print "\nEnter first player's name:\t"
  name1 = gets.chomp!

  print "\nEnter second player's name:\t"
  name2 = gets.chomp!

  if (!name1.empty? && !name2.empty?)
    player1 = Player.new(name1)
    player2 = Player.new(name2)
    
    return [player1, player2]
  else
    puts "\nTwo players are required."
    separate_by_dash
    get_players
  end
 
end

def run_game
  players = get_players
  separate_by_dash
  puts "#{players[0].name} Vs #{players[1].name}\n\n"
  separate_by_dash
  game = Game.new(true, players[0], players[1])
  is_live = game.will_continue?
  winner = game.get_winner
  while (winner.nil? && is_live)
    game.roll_dice
    winner = game.get_winner
    is_live = game.will_continue?
  end
end


run_game
