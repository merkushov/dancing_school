class ChangeTablePrice < ActiveRecord::Migration[5.0]
  def change
    
    add_column :prices, :no_scope_class_types, :boolean, default: true
    add_column :prices, :no_scope_locations, :boolean, default: true
    add_column :prices, :no_scope_users, :boolean, default: true

  end
end
