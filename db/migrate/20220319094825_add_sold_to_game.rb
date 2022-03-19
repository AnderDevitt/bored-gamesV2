class AddSoldToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :sold, :boolean, default:false
  end
end
