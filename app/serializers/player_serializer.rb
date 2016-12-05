class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :alive, :character_id
  has_one :game 
  has_one :character
end
