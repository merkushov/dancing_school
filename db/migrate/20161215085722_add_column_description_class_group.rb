class AddColumnDescriptionClassGroup < ActiveRecord::Migration[5.0]
  def change

    add_column :class_groups, :description, :text

  end
end
