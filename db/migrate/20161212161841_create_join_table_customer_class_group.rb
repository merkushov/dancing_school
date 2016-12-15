class CreateJoinTableCustomerClassGroup < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :class_groups,  table_name: 'customers_class_groups' do |t|
      t.index [:customer_id, :class_group_id]
      t.index [:class_group_id, :customer_id]
    end

    # автоматически удалять данные из таблицы связки
    add_foreign_key :customers_class_groups, :class_groups, on_delete: :cascade
    add_foreign_key :customers_class_groups, :customers, on_delete: :cascade
  end
end
