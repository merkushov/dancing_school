class DropJoinTableCustomerClassSchedule < ActiveRecord::Migration[5.0]
  def change
     drop_table :class_schedules_customers
  end
end
