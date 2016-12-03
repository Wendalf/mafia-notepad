class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :game_id
      t.integer :character_id
      t.string :name
      t.boolean :alive, null: false, default: true

      t.timestamps
    end
  end
end
