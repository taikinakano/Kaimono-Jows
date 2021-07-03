class RemoveTimestampFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :createe_at
    remove_column :shops, :updated_at
  end
end
