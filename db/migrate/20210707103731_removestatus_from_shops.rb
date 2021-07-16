class RemovestatusFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :status, :integer, limit: 1, default: 1, null: false
  end
end
