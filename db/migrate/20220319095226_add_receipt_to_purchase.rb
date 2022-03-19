class AddReceiptToPurchase < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :receipt_url, :string
  end
end
