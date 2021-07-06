class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index ["id"], name: "index_relationships_on_id"

      t.timestamps
    end
  end
end
