class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
			t.string :uuid, null: false, index: {unique: true}
      t.string :body, null: false
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
