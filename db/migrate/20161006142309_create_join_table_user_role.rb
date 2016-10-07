class CreateJoinTableUserRole < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :roles do |t|
      t.references :user, foreign_key: true, null: false
      t.references :role, foreign_key: true, null: false

      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id]
    end
  end
end
