class AddConversionShopNameToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :conversion_shop_name, :string
  end
end
