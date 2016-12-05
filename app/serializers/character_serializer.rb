class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :ability, :ap
  has_many :players 
end
