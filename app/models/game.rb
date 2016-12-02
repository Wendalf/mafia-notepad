class Game < ApplicationRecord
  belongs_to :user
  has_many :nights


  enum game_result: [:stillplaying, :mafia, :good_people]

end
