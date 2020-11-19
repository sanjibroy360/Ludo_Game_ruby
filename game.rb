require_relative "player"
require "securerandom"

class Game
  attr_reader :players, :game_id
  @@total_score = 30

  def initialize(is_live = true, player1, player2)
    @is_live = is_live
    @players = [player1, player2]
    @game_id = SecureRandom.uuid
    @current_player = 0
    @total_no_of_turns = 0
    @last_generated_value = 0

    player1.game_id = @game_id
    player2.game_id = @game_id
  end

  def status
    puts "\nGenrated value: #{@last_generated_value}"
    puts "#{@players[@current_player].name} rolled the dice and his total score is #{@players[@current_player].score}\n\n"
  end

  def handle_turns
    if (@last_generated_value == 6)
      puts "\n#{@players[@current_player].name} has one more chance!"
      roll_dice
    else
      @total_no_of_turns += 1
      @current_player = @total_no_of_turns % @players.length
    end
  end

  def roll_dice
    @last_generated_value = rand(1..6)
    increment_score
    status
    handle_turns
  end

  def increment_score
    @players[@current_player].score += @last_generated_value
  end
end
