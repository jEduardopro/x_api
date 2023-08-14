class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
			t.string :uuid, null: false, index: {unique: true}
      t.string :name, null: false
      t.string :username, null: false, index: {unique: true}
      t.string :email, null: false, index: {unique: true}
      t.datetime :email_verified_at
      t.string :password_digest, null: false
      t.string :password_salt, null: false
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
