require 'securerandom'
class Player
    attr_reader :name, :player_id
    attr_accessor :game_id, :score

    def  initialize(name, score=0)
        @name = name
        @score = score
        @game_id = nil
        @player_id = SecureRandom.uuid
    end
end