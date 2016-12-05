class Player < ApplicationRecord
  belongs_to :game
  belongs_to :character


  def self.alive_this_game_character(game, character)
    character_alive = where("game_id = ?", game.id).where("character_id = ?", character.id).where("alive = ?", true)
    character_alive != []
  end


end
