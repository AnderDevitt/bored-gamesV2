class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null:false
      t.integer :genre, null:false
      t.integer :minimum_players, null:false
      t.integer :maximum_players, null:false
      t.float :price, null:false
      t.text :description, null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
