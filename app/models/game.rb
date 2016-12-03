class Game < ApplicationRecord
  belongs_to :user
  has_many :nights
  has_many :players
  has_many :characters, through: :players

  enum game_result: [:stillplaying, :mafia, :good_people]

end
