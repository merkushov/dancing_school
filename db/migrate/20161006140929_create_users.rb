class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email,        limit: 255, null: false
      t.string :first_name,   limit: 127, null: false
      t.string :last_name,    limit: 127, null: false
      t.string :password_digest, null: false
      t.string :remember_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
