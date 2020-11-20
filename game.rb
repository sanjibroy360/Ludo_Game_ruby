require_relative "player"
require "securerandom"

class Game
  attr_reader :players, :game_id
  @@total_score = 50

  def initialize(is_live = true, player1, player2)
    @is_live = is_live
    @players = [player1, player2]
    @game_id = SecureRandom.uuid
    @current_player = 0
    @total_no_of_turns = 0
    @last_generated_value = 0
    @current_player_name = ""
    @no_of_sixes = 0

    player1.game_id = @game_id
    player2.game_id = @game_id
  end

  def separate_by_dash
    return puts "\n------------------------------------------------------------\n\n"
  end

  def current_player_score
    if (@no_of_sixes != 3)
      puts "\nWell done #{@current_player_name}, you have scored #{@last_generated_value}"
      puts "\nNow, your total score is #{@players[@current_player].score}\n"
    else
      puts "\n#{@current_player_name}, you have scored #{@last_generated_value} again"
    end
    separate_by_dash
  end

  def instructions
    @current_player_name = @players[@current_player].name
    puts "#{players[@current_player].name} it's your turn -" if (@last_generated_value != 6)
    puts "\nInstructions: "
    puts "Press enter key to roll the dice."
    puts "Enter 'exit' to quit the game"
    puts "You will not get any points if you score 6's 3 times consecutively\n\n"
  end

  def will_continue?
    if @is_live
      instructions
      player_input = gets

      if (player_input == "\n")
        return @is_live
      elsif (player_input.chomp.downcase == "exit")
        @is_live = false
      else
        puts "Please enter a valid input!"
        will_continue?
      end
    end
  end

  def handle_turns
    if (@last_generated_value == 6)
      if (@no_of_sixes == 3)
        puts "\n\nOops...!!!\n#{@current_player_name}, you have scored 3 consecutive 6's."
        puts "As per the rule no points will be added for these 3 turns."
        @players[@current_player].score -= (6 * @no_of_sixes)
        current_player_score
        @last_generated_value = 0
        @no_of_sixes = 0
        handle_turns
      else
        puts "\n\nHurray...!!!\n#{@current_player_name}, you have got one more chance!"
        will_continue?
        roll_dice
      end
    else
      @no_of_sixes = 0
      @total_no_of_turns += 1
      @current_player = (@total_no_of_turns % @players.length)
    end
  end

  def roll_dice
    @last_generated_value = rand(1..6)
    if (@last_generated_value == 6)
      @no_of_sixes += 1
    end
    increment_score
    current_player_score
    handle_turns
  end

  def increment_score
    score = @players[@current_player].score + @last_generated_value
    if (score <= @@total_score)
      @players[@current_player].score = score
    end
  end

  def get_winner
    winner = @players.select { |player| player.score == @@total_score }[0]
    if winner
      puts "#{winner.name} won the game!!!\n\n"
      @is_live = false
    end
    return winner
  end
end
