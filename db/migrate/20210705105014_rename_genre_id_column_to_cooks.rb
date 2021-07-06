class RenameGenreIdColumnToCooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :cooks, :genre_id, :user_id
  end
end
