class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null:false
      t.integer :genre
      t.integer :minimum_players
      t.integer :maximum_players
      t.float :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
