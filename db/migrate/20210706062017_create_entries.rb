class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index ["id"], name: "index_entries_on_id"

      t.timestamps
    end
  end
end
