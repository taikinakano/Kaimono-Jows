class AddConversionAddressToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :conversion_address, :string
  end
end
