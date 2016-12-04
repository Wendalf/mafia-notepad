class GameSerializer < ActiveModel::Serializer
  attributes :id, :capacity, :game_status
  has_one :user
end
