class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :image_id, null: false
      t.string :address, null: false
      t.text :comment, null: false
      t.datetime :createe_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
