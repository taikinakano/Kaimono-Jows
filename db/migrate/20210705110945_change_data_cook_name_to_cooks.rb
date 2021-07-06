class ChangeDataCookNameToCooks < ActiveRecord::Migration[5.2]
  def change
    change_column :cooks, :cook_name, :string
  end
end
