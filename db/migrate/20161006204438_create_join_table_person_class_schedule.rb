class CreateJoinTablePersonClassSchedule < ActiveRecord::Migration[5.0]
  def change
    create_join_table :people, :class_schedules do |t|
      t.references :person, foreign_key: true, null: false
      t.references :class_schedule, foreign_key: true, null: false
      t.boolean :is_paid, default: false

      t.index [:person_id, :class_schedule_id]
      t.index [:class_schedule_id, :person_id]
    end
  end
end
