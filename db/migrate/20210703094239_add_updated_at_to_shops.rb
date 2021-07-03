class AddUpdatedAtToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :updated_at, :datetime
  end
end
