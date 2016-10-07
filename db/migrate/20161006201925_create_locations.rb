class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name, limit: 255, null: false
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
