class Night < ApplicationRecord
  belongs_to :game
  has_many :players, through: :game
  has_many :characters, through: :game
end
