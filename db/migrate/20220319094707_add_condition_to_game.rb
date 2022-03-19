class AddConditionToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :condition, :integer, null:false
  end
end
