class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name, limit: 127, null: false
      t.string :last_name, limit: 127, null: false
      t.string :middle_name, limit: 127
      t.string :email
      t.string :phone_mobile, limit: 10
      t.date :birthday
      t.string :gender, limit: 1
      t.string :photo
      t.text :description

      t.timestamps
    end
    add_index :people, :email
    add_index :people, :phone_mobile
    add_index :people, [:first_name, :last_name, :middle_name]
  end
end
