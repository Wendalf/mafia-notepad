class Game < ApplicationRecord
  belongs_to :user

  enum game_result: [:stillplaying, :mafia, :good_people]

end
