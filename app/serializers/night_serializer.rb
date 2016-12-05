class NightSerializer < ActiveModel::Serializer
  attributes :id, :logs, :notes
  has_one :game
end
