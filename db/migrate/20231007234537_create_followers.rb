class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
			t.references :follower, type: :bigint, index: true, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
			t.references :followed, type: :bigint, index: true, null: false, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end
