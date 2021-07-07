class RemoveStatusFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :status, :integer, limit: 1, default: 1, null: false
  end
end
