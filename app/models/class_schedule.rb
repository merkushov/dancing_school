class ClassSchedule < ApplicationRecord
  belongs_to :class_type
  belongs_to :hall
  belongs_to :user

  has_many :visits
  has_many :customers, through: :visits
end
