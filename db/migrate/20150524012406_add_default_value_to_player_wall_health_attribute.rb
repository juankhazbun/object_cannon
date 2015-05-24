class AddDefaultValueToPlayerWallHealthAttribute < ActiveRecord::Migration
  	def up
		change_column :players, :wall_health, :integer, default: 100
	end

	def down
		change_column :players, :wall_health, :integer, default: nil
	end
end
