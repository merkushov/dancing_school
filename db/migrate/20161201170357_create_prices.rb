class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :name, limit: 255, null: false
      t.string :status, limit: 64, null: false
      t.decimal :value, precision: 5, scale: 2
      t.string :period_start_type, null: false
      t.string :period_end_type, null: false
      t.integer :period_end_days
      t.datetime :period_start_date
      t.datetime :period_end_date
      t.string :visit_limit_type, null: false
      t.integer :visit_number
      t.integer :visit_hour_number
      t.text :description

      t.timestamps
    end
  end
end
