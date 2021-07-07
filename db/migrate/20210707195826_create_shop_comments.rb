class CreateShopComments < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_comments do |t|
      t.text :comment, null: false
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.index ["id"], name: "index_shop_comments_on_id"
      t.timestamps
    end
  end
end
