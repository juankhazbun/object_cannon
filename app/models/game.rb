class Game < ActiveRecord::Base
	belongs_to :player1, class_name: 'Player', foreign_key: 'player1_id'
	accepts_nested_attributes_for :player1
	belongs_to :player2, class_name: 'Player', foreign_key: 'player2_id'
	accepts_nested_attributes_for :player2

	validates :turn, inclusion: { in: [1, 2] }
	validates :winner, inclusion: { in: [0, 1, 2] }
end
