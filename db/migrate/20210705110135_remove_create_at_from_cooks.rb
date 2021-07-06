class RemoveCreateAtFromCooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :cooks, :create_at, :datetime
  end
end
