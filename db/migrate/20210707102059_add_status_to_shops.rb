class AddStatusToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :status, :integer, default: 0, null: false
  end
end
