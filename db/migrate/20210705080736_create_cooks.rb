class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.integer :genre_id, null: false
      t.integer :cook_name, null: false
      t.string :image_id, null: false
      t.text :cook_method, null: false
      t.text :cook_material, null: false
      t.datetime :create_at, null: false
      t.datetime :updated_at, null: false
      t.index ["id"], name: "index_cooks_on_id"

      t.timestamps
    end
  end
end
