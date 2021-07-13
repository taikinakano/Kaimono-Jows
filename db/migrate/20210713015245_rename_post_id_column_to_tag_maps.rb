class RenamePostIdColumnToTagMaps < ActiveRecord::Migration[5.2]
  def change
    rename_column :tag_maps, :post_id, :cook_id
  end
end
