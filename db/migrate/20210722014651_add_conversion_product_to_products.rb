class AddConversionProductToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :conversion_product, :string
  end
end
