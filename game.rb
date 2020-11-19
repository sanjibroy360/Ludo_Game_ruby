require_relative "player"
require 'securerandom'

class Game
  attr_reader :players, :game_id
  @@total_score = 30

  def initialize(is_live = true, player1, player2)
    @is_live = is_live
    @players = [player1, player2]
    @game_id = SecureRandom.uuid
    @current_player = 0
    @total_no_of_turns = 0

    player1.game_id = @game_id
    player2.game_id = @game_id
  end

  def handle_turns
    @current_player = @total_no_of_turns % 2
  end

  def roll_dice
      generated_value = rand(1..6)
      handle_turns
      @players[@current_player].score += generated_value

      puts "\nGenrated value: #{generated_value}"
      puts "#{@players[@current_player].name} rolled the dice and his total score is #{@players[@current_player].score}"

      @total_no_of_turns += 1
  end


end
