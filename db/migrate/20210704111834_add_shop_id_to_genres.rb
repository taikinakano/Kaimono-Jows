class AddShopIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :shop_id, :integer
  end
end
