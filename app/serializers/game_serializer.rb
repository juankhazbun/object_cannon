class GameSerializer < ActiveModel::Serializer
  attributes :id, :turn, :winner
  has_one :player1
  has_one :player2
end
