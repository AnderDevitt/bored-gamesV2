class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :street_number, null:false
      t.string :street_name, null:false
      t.string :suburb, null:false
      t.string :state, null:false
      t.string :postcode, null:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
