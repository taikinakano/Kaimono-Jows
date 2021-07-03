class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :shop_id, null: false
      t.integer :genre_id, null: false
      t.string :image_id
      t.string :product_name, null: false
      t.text :product_memo, null: false
      t.integer :price, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index ["id"], name: "index_products_on_id"
      t.timestamps
    end
  end
end
