class AddDefaultValueToTurnAndWinnerAttributes < ActiveRecord::Migration
	def up
  		change_column :games, :turn, :integer, default: 1
  		change_column :games, :winner, :integer, default: 0
	end

	def down
  		change_column :games, :turn, :integer, default: nil
  		change_column :games, :winner, :integer, default: nil
	end
end
