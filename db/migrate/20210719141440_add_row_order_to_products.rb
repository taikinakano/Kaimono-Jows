class AddRowOrderToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :row_order, :integer
  end
end
