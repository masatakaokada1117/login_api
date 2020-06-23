class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :access_token
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :access_token, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
