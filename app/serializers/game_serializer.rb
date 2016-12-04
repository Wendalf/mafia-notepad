class GameSerializer < ActiveModel::Serializer
  attributes :id, :capacity, :game_status
end
