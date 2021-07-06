class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :room_id, null: false
      t.text :message, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index ["id"], name: "index_messages_on_id"

      t.timestamps
    end
  end
end
