class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :capacity
      t.integer :game_status, default: 0

      t.timestamps
    end
  end
end
