class AddRowOrderToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :row_order, :integer
  end
end
