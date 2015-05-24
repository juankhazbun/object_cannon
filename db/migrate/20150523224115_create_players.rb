class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :wall_health

      t.timestamps null: false
    end
  end
end
