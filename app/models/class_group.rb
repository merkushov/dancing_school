class ClassGroup < ApplicationRecord
  has_and_belongs_to_many :customers, join_table: "customers_class_groups"
end
