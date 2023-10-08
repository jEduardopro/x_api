class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

			# add_reference :followers, :follower, foreign_key: { to_table: :users }
			# add_reference :followers, :followed, foreign_key: { to_table: :users }

			# add_foreign_key :followers, :users, column: :follower_id, on_delete: :cascade
			# add_foreign_key :followers, :users, column: :followed_id, on_delete: :cascade

      t.timestamps
    end
  end
end
