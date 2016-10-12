class CreateJoinTableCustomerClassSchedule < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :class_schedules do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :class_schedule, foreign_key: true, null: false
      t.boolean :is_paid, default: false

      t.index [:customer_id, :class_schedule_id], name: 'index_customer_id_class_schedule_id'
      t.index [:class_schedule_id, :customer_id], name: 'index_class_schedule_id_customer_id'
    end
  end
end
