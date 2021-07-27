class RemoveRowOrdereFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :row_ordere, :integer
  end
end
