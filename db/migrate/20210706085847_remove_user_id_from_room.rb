class RemoveUserIdFromRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :user_id, :integer
  end
end
