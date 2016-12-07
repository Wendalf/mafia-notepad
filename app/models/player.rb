class Player < ApplicationRecord
  belongs_to :game
  belongs_to :character


  def self.alive_this_game_character(game, character)
    character_alive = where("game_id = ?", game.id).where("character_id = ?", character.id).where("alive = ?", true)
    character_alive != []
  end

  def self.alive_game_players(game)
    where("game_id = ?", game.id).where("alive = ?", true)
  end

  def self.alive_mafia_number(game)
    alive_game_players(game).where("character_id = ?", "2").size
  end

  def self.alive_good_people_number(game)
    alive_game_players(game).size - alive_mafia_number(game)
  end

end
