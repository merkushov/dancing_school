class CreateJoinTablePriceClassType < ActiveRecord::Migration[5.0]
  def change
    create_join_table :prices, :class_types, table_name: 'prices_class_types' do |t|
      t.references :price, foreign_key: true, null: false
      t.references :class_type, foreign_key: true, null: false

      t.index [:price_id, :class_type_id]
      t.index [:class_type_id, :price_id]
    end
  end
end
