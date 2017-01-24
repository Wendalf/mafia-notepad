class Game < ApplicationRecord
  belongs_to :user
  has_many :nights
  has_many :players
  has_many :characters, -> { distinct }, through: :players

  accepts_nested_attributes_for :players

  enum game_status: [:stillplaying, :mafia, :good_people]

  def alive_players(character)
    if character.name == "doctor"
      Player.where("game_id = ?", self.id).where("alive = ?", true)
    else
      Player.where("game_id = ?", self.id).where("alive = ?", true).where.not("character_id = ?", character.id)
    end
  end

end
