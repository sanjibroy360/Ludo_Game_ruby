require_relative "player"
require 'securerandom'

class Game
  attr_reader :players, :game_id
  @@total_score = 30

  def initialize(is_live = true, player1, player2)
    @is_live = is_live
    @players = [player1, player2]
    @game_id = SecureRandom.uuid

    player1.game_id = @game_id
    player2.game_id = @game_id
  end


end
