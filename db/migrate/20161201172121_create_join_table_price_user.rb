class CreateJoinTablePriceUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :prices, :users do |t|
      t.references :price, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.index [:price_id, :user_id]
      t.index [:user_id, :price_id]
    end
  end
end
