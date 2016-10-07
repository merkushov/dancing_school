class CreateClassTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :class_types do |t|
      t.string :name, limit: 255, null: false

      t.timestamps
    end
    add_index :class_types, :name
  end
end
