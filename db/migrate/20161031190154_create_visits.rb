class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.references :class_schedule, foreign_key: true
      t.references :customer, foreign_key: true
      t.boolean :is_paid

      t.timestamps
    end
    add_index :visits, [:class_schedule_id, :customer_id], unique: true
  end
end
