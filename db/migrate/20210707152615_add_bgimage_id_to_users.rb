class AddBgimageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bgimage_id, :string
  end
end
