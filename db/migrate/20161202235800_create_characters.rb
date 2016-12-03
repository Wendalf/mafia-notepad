class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :ability
      t.integer :ap, default: 0
      t.string :description

      t.timestamps
    end
  end
end
