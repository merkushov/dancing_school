class CreateClassSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :class_schedules do |t|
      t.datetime :date_begin, null: false
      t.datetime :date_end, null: false
      t.decimal :cost, precision: 5, scale: 2, null: false
      t.references :class_type, foreign_key: true, null: false
      t.references :location, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :class_schedules, :date_begin
    add_index :class_schedules, :date_end
  end
end
