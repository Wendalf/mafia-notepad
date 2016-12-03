class Character < ApplicationRecord
  has_many :players
  has_many :games, through: :players



  enum ap: [:blocked, :kill, :check, :heal, :block]
end
