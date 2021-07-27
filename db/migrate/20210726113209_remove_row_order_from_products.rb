class RemoveRowOrderFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :row_order, :integer
  end
end
