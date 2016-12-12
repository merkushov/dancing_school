class CreateJoinTablePriceLocation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :prices, :locations, table_name: 'prices_locations' do |t|
      t.references :price, foreign_key: true, null: false
      t.references :location, foreign_key: true, null: false

      t.index [:price_id, :location_id]
      t.index [:location_id, :price_id]
    end
  end
end
