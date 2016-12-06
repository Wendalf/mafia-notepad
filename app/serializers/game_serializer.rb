class GameSerializer < ActiveModel::Serializer
  attributes :id, :capacity, :game_status
  has_one :user
  has_many :players
  has_many :nights
  has_many :characters

end
